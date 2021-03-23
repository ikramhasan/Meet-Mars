import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

downloadImage(String rover, String imageUrl) async {
  final status = await Permission.storage.request();
  Directory directory = await getExternalStorageDirectory();
  String newPath = '';
  List<String> folders = directory.path.split('/');
  for (int i = 1; i < folders.length; i++) {
    String folder = folders[i];
    if (folder != 'Android') {
      newPath += '/' + folder;
    } else {
      break;
    }
  }
  newPath = newPath + '/Pictures/MeetMars';
  directory = Directory(newPath);
  directory.createSync();

  if (status.isGranted) {
    final id = await FlutterDownloader.enqueue(
      url: imageUrl,
      savedDir: directory.path,
      fileName: '$rover - ${DateTime.now()}.jpg',
      showNotification: true,
      openFileFromNotification: true,
    );
  } else {
    print('Permission Denied');
  }
}
