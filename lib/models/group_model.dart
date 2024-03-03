class GroupModel {
  int id;
  String code;
  String description;
  bool active;
  String creationDate;
  String disabledDate;
  String parentGroup;
  String sonGroup;

  GroupModel(
      {required this.id,
      required this.code,
      required this.description,
      required this.active,
      required this.creationDate,
      required this.disabledDate,
      required this.parentGroup,
      required this.sonGroup});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'] as int? ?? 99,
      active: json['active'] as bool? ?? false,
      creationDate: json['creationDate'] as String? ?? "",
      disabledDate: json['disabledDate'] as String? ?? "",
      code: json["code"] as String? ?? "",
      description: json["description"] as String? ?? "",
      parentGroup: json["parentGroup"] as String? ?? "",
      sonGroup: json["sonGroup"] as String? ?? "",
    );
  }
}
