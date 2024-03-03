import 'package:por_maria_app/models/position_role_model.dart';

class PositionModel {
  int id;
  String code;
  String description;
  bool active;
  String creationDate;
  String disabledDate;
  List<PositionRoleModel> positionRole;

  PositionModel(
      {required this.id,
      required this.code,
      required this.description,
      required this.active,
      required this.creationDate,
      required this.disabledDate,
      required this.positionRole});

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      id: json['id'] as int? ?? 104,
      active: json['active'] as bool? ?? false,
      creationDate: json['creationDate'] as String? ?? "",
      disabledDate: json['disabledDate'] as String? ?? "",
      code: json["code"] as String? ?? "",
      description: json["description"] as String? ?? "",
      positionRole: (json['positionRole'] as List<dynamic>?)
              ?.map((positionRole) => PositionRoleModel.fromJson(
                  positionRole as Map<String, dynamic>? ?? Map()))
              .toList() ??
          [],
    );
  }
}
