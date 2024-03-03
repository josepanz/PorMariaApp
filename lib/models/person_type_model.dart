class PersonTypeModel {
  int id;
  String code;
  String value;
  String description;
  String creationDate;
  bool enabled;

  PersonTypeModel(
      {required this.id,
      required this.code,
      required this.value,
      required this.description,
      required this.creationDate,
      required this.enabled});

  factory PersonTypeModel.fromJson(Map<String, dynamic> json) {
    return PersonTypeModel(
        id: json["id"] as int? ?? 102,
        value: json["value"] as String? ?? "",
        description: json["description"] as String? ?? "",
        creationDate: json["creationDate"] as String? ?? "",
        code: json["code"] as String? ?? "",
        enabled: json["enabled"] as bool? ?? false);
  }
}
