import 'package:flutter/foundation.dart';

class RoverData {
  static List<Rover> roverList = [
    Rover(
      id: 'perseverance',
      name: 'Perseverance',
      imageUrl: 'assets/images/perseverance.png',
      isLatest: true,
      isActive: true,
    ),
    Rover(
      id: 'curiosity',
      name: 'Curiosity',
      imageUrl: 'assets/images/curiosity.png',
      isLatest: false,
      isActive: true,
    ),
    Rover(
      id: 'spirit',
      name: 'Spirit',
      imageUrl: 'assets/images/spirit.png',
      isLatest: false,
      isActive: false,
    ),
    Rover(
      id: 'opportunity',
      name: 'Opportunity',
      imageUrl: 'assets/images/spirit.png',
      isLatest: false,
      isActive: false,
    ),
  ];
}

class Rover {
  final String id;
  final String name;
  final String imageUrl;
  final bool isLatest;
  final bool isActive;

  Rover({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.isLatest,
    @required this.isActive,
  });
}
