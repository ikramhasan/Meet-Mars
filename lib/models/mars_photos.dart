// To parse this JSON data, do
//
//     final marsPhotos = marsPhotosFromJson(jsonString);

import 'dart:convert';

import 'latest_photo.dart';

MarsPhotos marsPhotosFromJson(String str) => MarsPhotos.fromJson(json.decode(str));

String marsPhotosToJson(MarsPhotos data) => json.encode(data.toJson());

class MarsPhotos {
    MarsPhotos({
        this.latestPhotos,
    });

    List<LatestPhoto> latestPhotos;

    factory MarsPhotos.fromJson(Map<String, dynamic> json) => MarsPhotos(
        latestPhotos: List<LatestPhoto>.from(json["latest_photos"].map((x) => LatestPhoto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "latest_photos": List<dynamic>.from(latestPhotos.map((x) => x.toJson())),
    };
}