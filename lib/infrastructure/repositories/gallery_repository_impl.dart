import 'package:gallery_app/domain/domain.dart';
import 'package:gallery_app/infrastructure/datasources/gallery_datasource_impl.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  final GalleryDatasource datasource;

  GalleryRepositoryImpl({GalleryDatasource? datasource})
      : datasource = datasource ?? GalleryDatasourceImpl();

  @override
  Future<List<PhotoEntity>> getPhotos(int count) {
    return datasource.getPhotos(count);
  }
}
