import 'camera.dart';
import 'rover.dart';

class LatestPhoto {
    LatestPhoto({
        this.id,
        this.sol,
        this.camera,
        this.imgSrc,
        this.earthDate,
        this.rover,
    });

    int id;
    int sol;
    Camera camera;
    String imgSrc;
    DateTime earthDate;
    Rover rover;

    factory LatestPhoto.fromJson(Map<String, dynamic> json) => LatestPhoto(
        id: json["id"],
        sol: json["sol"],
        camera: Camera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sol": sol,
        "camera": camera.toJson(),
        "img_src": imgSrc,
        "earth_date": "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
        "rover": rover.toJson(),
    };
}