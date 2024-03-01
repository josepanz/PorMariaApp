import 'package:por_maria_app/models/position_model.dart';
import 'package:por_maria_app/models/role_model.dart';

class PositionRoleModel {
  int id;
  PositionModel position;
  RoleModel role;
  String assignmentDate;

  PositionRoleModel(this.id, this.position, this.role, this.assignmentDate);
}
