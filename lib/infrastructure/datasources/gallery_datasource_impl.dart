import 'package:gallery_app/config/config.dart';
import 'package:gallery_app/domain/domain.dart';
import 'package:http/http.dart' as http;

class GalleryDatasourceImpl extends GalleryDatasource {
  final http.Client client = http.Client();

  @override
  Future<List<PhotoEntity>> getPhotos(int count) async {
    try {
      Uri url = Uri.parse(
        "${Environment.apiRest}/photos/random/?count=${count.toString()}&client_id=${Environment.accesKey}",
      );
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final photos = photoEntityFromJson(response.body);
        return photos;
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}
