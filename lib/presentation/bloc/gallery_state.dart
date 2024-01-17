part of 'gallery_bloc.dart';

enum GalleryStatus { initial, success, failure }

class GalleryState extends Equatable {
  final GalleryStatus status;
  final List<PhotoEntity> photos;
  final bool hasReachedMax;
  const GalleryState({
    this.status = GalleryStatus.initial,
    this.photos = const [],
    this.hasReachedMax = false,
  });

  GalleryState copyWith({
    GalleryStatus? status,
    List<PhotoEntity>? photos,
    bool? hasReachedMax,
  }) =>
      GalleryState(
        status: status ?? this.status,
        photos: photos ?? this.photos,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object> get props => [status, photos, hasReachedMax];
}

final class GalleryInitial extends GalleryState {}
