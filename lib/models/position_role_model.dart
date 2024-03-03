import 'package:por_maria_app/models/position_model.dart';
import 'package:por_maria_app/models/role_model.dart';

class PositionRoleModel {
  int id;
  PositionModel position;
  RoleModel role;
  String assignmentDate;

  PositionRoleModel(
      {required this.id,
      required this.position,
      required this.role,
      required this.assignmentDate});

  factory PositionRoleModel.fromJson(Map<String, dynamic> json) {
    return PositionRoleModel(
      id: json['id'] as int? ?? 97,
      position: PositionModel.fromJson(
          json['position'] as Map<String, dynamic>? ?? Map()),
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>? ?? Map()),
      assignmentDate: json['assignmentDate'] as String? ?? "",
    );
  }
}
