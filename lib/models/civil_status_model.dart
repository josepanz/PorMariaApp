class CivilStatusModel {
  int id;
  String description;
  String creationDate;
  String code;

  CivilStatusModel(
      {required this.id,
      required this.description,
      required this.creationDate,
      required this.code});

  factory CivilStatusModel.fromJson(Map<String, dynamic> json) {
    return CivilStatusModel(
        id: json["id"] as int? ?? 98,
        description: json["description"] as String? ?? "",
        creationDate: json["creationDate"] as String? ?? "",
        code: json["code"] as String? ?? "");
  }
}
