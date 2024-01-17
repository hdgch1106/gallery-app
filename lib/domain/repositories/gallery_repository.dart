import 'package:gallery_app/domain/domain.dart';

abstract class GalleryRepository {
  Future<List<PhotoEntity>> getPhotos(int count);
}
