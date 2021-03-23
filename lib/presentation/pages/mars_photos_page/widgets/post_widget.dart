import 'package:flutter/material.dart';
import 'package:meet_mars/data/rover_data.dart';
import 'package:meet_mars/presentation/pages/image_view_page/image_view_page.dart';
import 'package:meet_mars/presentation/pages/mars_photos_page/widgets/reaction_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meet_mars/models/latest_photo.dart';
import 'package:meet_mars/models/mars_photos.dart';

class PostWidget extends StatelessWidget {
  final MarsPhotos marsPhotoList;

  const PostWidget(this.marsPhotoList);
  @override
  Widget build(BuildContext context) {
    String avatarPic;
    switch (marsPhotoList.latestPhotos[0].rover.name) {
      case 'Curiosity':
        avatarPic = RoverData.roverList[1].imageUrl;
        break;
      case 'Perseverance':
        avatarPic = RoverData.roverList[0].imageUrl;
        break;
      case 'Opportunity':
        avatarPic = RoverData.roverList[2].imageUrl;
        break;
      default:
        avatarPic = 'https://i.imgur.com/spirit.png';
    }
    buildHeader(LatestPhoto post) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              avatarPic,
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Text(
                post.rover.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 4),
              Text(
                Jiffy(post.earthDate, "yyyy-MM-dd").fromNow(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: marsPhotoList.latestPhotos.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final LatestPhoto post = marsPhotoList.latestPhotos[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            color: Colors.grey.shade900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 396,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: buildHeader(post),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            text:
                                'I took this photo on my ${post.sol}\'th martian day using my ',
                            children: [
                              TextSpan(
                                text: post.camera.fullName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' camera'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ImageViewPage(post)),
                          );
                        },
                        child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            post.imgSrc,
                            height: 300,
                            fit: BoxFit.cover,
                            loadingBuilder: (
                              BuildContext context,
                              Widget child,
                              ImageChunkEvent loadingProgress,
                            ) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 100,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                        Colors.redAccent),
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 8,
                  endIndent: 8,
                  color: Colors.grey,
                  height: 4,
                ),
                ReactionBar(post: post, selectedIndex: index),
              ],
            ),
          ),
        );
      },
    );
  }
}
