import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_app/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

const _photosLimit = 60;
const _photosGetCount = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository galleryRepository;
  GalleryBloc({required this.galleryRepository}) : super(GalleryInitial()) {
    on<GalleryFetched>(
      _onGalleryFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGalleryFetched(
      GalleryFetched event, Emitter<GalleryState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == GalleryStatus.initial) {
        final photos = await galleryRepository.getPhotos(_photosGetCount);
        return emit(state.copyWith(
          status: GalleryStatus.success,
          photos: photos,
          hasReachedMax: photos.length > _photosLimit,
        ));
      }
      final photos = await galleryRepository.getPhotos(_photosGetCount);

      emit(state.copyWith(
        status: GalleryStatus.success,
        photos: [...state.photos, ...photos],
        hasReachedMax: [...state.photos, ...photos].length >= _photosLimit,
      ));
    } catch (e) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }
}
