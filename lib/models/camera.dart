class Camera {
    Camera({
        this.id,
        this.name,
        this.roverId,
        this.fullName,
    });

    int id;
    String name;
    int roverId;
    String fullName;

    factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        id: json["id"],
        name: json["name"],
        roverId: json["rover_id"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rover_id": roverId,
        "full_name": fullName,
    };
}