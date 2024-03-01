import 'package:por_maria_app/models/group_model.dart';
import 'package:por_maria_app/models/position_model.dart';

class MembershipModel {
  int id;

  GroupModel group;

  PositionModel position;

  String creationDate;

  bool active;

  String disabledDate;

  MembershipModel(this.id, this.group, this.position, this.creationDate,
      this.active, this.disabledDate);
}
