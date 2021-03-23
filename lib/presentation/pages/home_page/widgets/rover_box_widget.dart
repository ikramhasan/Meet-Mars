import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_mars/cubit/mars_photos_cubit.dart';
import 'package:meet_mars/data/rover_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_mars/presentation/pages/mars_photos_page/mars_photos_page.dart';

class RoverBoxWidget extends StatelessWidget {
  final Rover rover;
  final double height;
  final double width;

  const RoverBoxWidget({
    @required this.rover,
    @required this.height,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    buildChip(String text, Color color) {
      return Container(
        height: 15,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 10),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        final marsPhotoBloc = context.read<MarsPhotosCubit>();
        marsPhotoBloc.getRoverPhotos(rover.id);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MarsPhotosPage(rover.name)),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              gradient: RadialGradient(
                colors: [
                  Color(0xff5fe686).withOpacity(0.26),
                  Color(0xff262d2e).withOpacity(0.23)
                ],
                radius: 0.72,
                center: Alignment(0, 0),
              ),
              border: Border.all(
                width: 4,
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: const Color(0xff000000).withOpacity(0.16),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    rover.imageUrl,
                    fit: BoxFit.cover,
                    height: rover.id == 'perseverance' ? 150 : 130,
                    width: rover.id == 'perseverance' ? 240 : 180,
                    // loadingBuilder: (
                    //   BuildContext context,
                    //   Widget child,
                    //   ImageChunkEvent loadingProgress,
                    // ) {
                    //   if (loadingProgress == null) return child;
                    //   return Container(
                    //     height: 100,
                    //     width: 100,
                    //     child: Center(
                    //       child: CircularProgressIndicator(
                    //         valueColor:
                    //             AlwaysStoppedAnimation(Colors.redAccent),
                    //         value: loadingProgress.expectedTotalBytes != null
                    //             ? loadingProgress.cumulativeBytesLoaded /
                    //                 loadingProgress.expectedTotalBytes
                    //             : null,
                    //       ),
                    //     ),
                    //   );
                    // },
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        rover.name,
                        style: GoogleFonts.abel(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          rover.isActive
              ? Positioned(
                  top: 16,
                  right: 16,
                  child: buildChip('Active', Colors.greenAccent),
                )
              : Container(),
          rover.isLatest
              ? Positioned(
                  top: 36,
                  right: 16,
                  child: buildChip('Latest', Colors.blueAccent),
                )
              : Container(),
        ],
      ),
    );
  }
}
