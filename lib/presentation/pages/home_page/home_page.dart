import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_mars/presentation/pages/about_page/about_page.dart';
import 'package:meet_mars/presentation/pages/home_page/widgets/rover_list_widget.dart';
import 'package:meet_mars/repository/nasa_api_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final api = NasaApiRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Meet Mars',
                        style: GoogleFonts.dancingScript(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      Image.asset(
                        'assets/images/mars.png',
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.info),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.8),
                        builder: (_) => AlertDialog(
                          backgroundColor: Theme.of(context).canvasColor,
                          content: AboutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text(
                'Rovers',
                style: GoogleFonts.abel(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: RoverListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
