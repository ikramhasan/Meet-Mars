import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meet_mars/models/latest_photo.dart';
import 'package:meet_mars/presentation/show_snakbar/show_snackbar.dart';
import 'package:meet_mars/utils/file_downloader.dart';
import 'package:meet_mars/utils/file_share.dart';
import 'package:share/share.dart';

class ImageViewPage extends StatelessWidget {
  final LatestPhoto post;

  const ImageViewPage(this.post);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    File file;

    return Scaffold(
      appBar: AppBar(actions: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () async {
                  showSnackBar(
                    message: 'Getting image. Please wait...',
                    context: context,
                  );
                  file = await fileFromImageUrl(post.imgSrc);
                  Share.shareFiles(
                    [file.path],
                    text:
                        'Check out this cool photo taken by the ${post.rover.name} rover on mars!',
                  );
                },
                child: Container(
                  height: 60,
                  width: 50,
                  child: Icon(Icons.ios_share),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                showSnackBar(
                  message: 'Download started',
                  context: context,
                );
                await downloadImage(post.rover.name, post.imgSrc);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 60,
                  width: 50,
                  child: Icon(Icons.file_download),
                ),
              ),
            ),
          ],
        ),
      ]),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(
            post.imgSrc,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
