class PersonContactTypeModel {
  int id;
  String description;
  String creationDatetime;
  bool isSocialMedia;

  PersonContactTypeModel(
      {required this.id,
      required this.description,
      required this.creationDatetime,
      required this.isSocialMedia});

  factory PersonContactTypeModel.fromJson(Map<String, dynamic> json) {
    return PersonContactTypeModel(
        id: json["id"] as int? ?? 100,
        description: json["description"] as String? ?? "",
        creationDatetime: json["creationDatetime"] as String? ?? "",
        isSocialMedia: json["isSocialMedia"] as bool? ?? false);
  }
}
