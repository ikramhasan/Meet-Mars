import 'package:http/http.dart' as http;
import 'package:meet_mars/core/failure.dart';
import 'package:meet_mars/keys/key.dart';
import 'package:meet_mars/models/mars_photos.dart';

class NasaApiRepository {
  final String baseUrl = 'https://api.nasa.gov/mars-photos/api/v1/rovers';
  final String apiKey = API_KEY;

  getPhotoListFromApi(String roverName) async {
    final Uri url = Uri.parse(
      '$baseUrl/$roverName/latest_photos?api_key=$apiKey',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return marsPhotosFromJson(response.body);
    } else {
      throw ServerFailure(response.statusCode);
    }
  }
}
