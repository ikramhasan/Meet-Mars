import 'package:flutter/material.dart';
import 'package:meet_mars/data/rover_data.dart';
import 'package:meet_mars/presentation/pages/home_page/widgets/rover_box_widget.dart';

class RoverListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        RoverBoxWidget(
          rover: RoverData.roverList[0],
          height: 250,
          width: width - 32,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            RoverBoxWidget(
              rover: RoverData.roverList[1],
              height: 250,
              width: width / 2 - 16 - 8,
            ),
            SizedBox(width: 16),
            RoverBoxWidget(
              rover: RoverData.roverList[3],
              height: 250,
              width: width / 2 - 16 - 8,
            ),
          ],
        ),
      ],
    );
  }
}
