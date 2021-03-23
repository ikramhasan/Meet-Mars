import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<File> fileFromImageUrl(String imageUrl) async {
  final Uri url = Uri.parse(imageUrl);

  var response = await http.get(url);

  final documentDirectory = await getApplicationDocumentsDirectory();

  final file = File(join(documentDirectory.path, 'mars.png'));

  file.writeAsBytesSync(response.bodyBytes);

  return file;
}
