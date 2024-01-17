import 'package:gallery_app/domain/domain.dart';

abstract class GalleryDatasource {
  Future<List<PhotoEntity>> getPhotos(int count);
}
