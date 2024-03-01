import 'package:por_maria_app/models/position_role_model.dart';

class PositionModel {
  int id;
  String code;
  String description;
  bool active;
  String creationDate;
  String disabledDate;
  List<PositionRoleModel> positionRole;

  PositionModel(this.id, this.code, this.description, this.active,
      this.creationDate, this.disabledDate, this.positionRole);
}
