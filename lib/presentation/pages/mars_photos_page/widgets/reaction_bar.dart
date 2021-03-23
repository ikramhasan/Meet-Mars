import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meet_mars/models/latest_photo.dart';
import 'package:meet_mars/presentation/show_snakbar/show_snackbar.dart';
import 'package:meet_mars/utils/file_downloader.dart';
import 'package:meet_mars/utils/file_share.dart';
import 'package:share/share.dart';

class ReactionBar extends StatefulWidget {
  final LatestPhoto post;
  final int selectedIndex;

  const ReactionBar({
    @required this.post,
    @required this.selectedIndex,
  });

  @override
  _ReactionBarState createState() => _ReactionBarState();
}

class _ReactionBarState extends State<ReactionBar> {
  bool likePressed = false;
  int index;
  File file;

  @override
  Widget build(BuildContext context) {
    buildReactionWidget({
      @required IconData icon,
      @required String text,
    }) {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
            text == 'Like' ? SizedBox(width: 8) : Container(),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 34),
      height: 45,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                likePressed = !likePressed;
                index = widget.selectedIndex;
              });
            },
            child: buildReactionWidget(
              text: 'Like',
              icon: index == widget.selectedIndex && likePressed
                  ? Icons.thumb_up_sharp
                  : Icons.thumb_up_outlined,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () async {
              showSnackBar(
                message: 'Download started',
                context: context,
              );
              await downloadImage(widget.post.rover.name, widget.post.imgSrc);
            },
            child: buildReactionWidget(
              text: 'Download',
              icon: Icons.file_download,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () async {
              showSnackBar(
                message: 'Getting image. Please wait...',
                context: context,
              );
              file = await fileFromImageUrl(widget.post.imgSrc);
              Share.shareFiles(
                [file.path],
                text:
                    'Check out this cool photo taken by the ${widget.post.rover.name} rover on mars!',
              );
            },
            child: buildReactionWidget(
              text: 'Share',
              icon: Icons.share_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
