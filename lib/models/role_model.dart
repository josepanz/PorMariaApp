class RoleModel {
  int id;
  String code;
  String description;
  String creationDate;
  bool enabled;
  bool hidden;

  RoleModel(
      {required this.id,
      required this.code,
      required this.description,
      required this.creationDate,
      required this.enabled,
      required this.hidden});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'] as int? ?? 105,
      hidden: json['hidden'] as bool? ?? false,
      code: json['code'] as String? ?? "",
      creationDate: json['creationDate'] as String? ?? "",
      description: json['description'] as String? ?? "",
      enabled: json['enabled'] as bool? ?? false,
    );
  }
}
