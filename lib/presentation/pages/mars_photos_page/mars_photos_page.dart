import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet_mars/cubit/mars_photos_cubit.dart';
import 'package:meet_mars/presentation/pages/mars_photos_page/widgets/post_widget.dart';
import 'package:meet_mars/utils/launch_url.dart';

class MarsPhotosPage extends StatelessWidget {
  final String roverName;

  const MarsPhotosPage(this.roverName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          roverName,
          style: GoogleFonts.abel(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<MarsPhotosCubit, MarsPhotosState>(
          listener: (context, state) {
            if (state is MarsPhotosError) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error Occurred!'),
                    content: Text('Error code: ${state.errorCode.toString()}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          sendMail(state.errorCode.toString());
                        },
                        child: Text('Send bug'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) {
            if (state is MarsPhotosLoading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                ),
              );
            } else if (state is MarsPhotosLoaded) {
              return PostWidget(state.marsPhotos);
            } else {
              return Center(
                child: Text('Please try again later or submit a bug'),
              );
            }
          },
        ),
      ),
    );
  }
}
