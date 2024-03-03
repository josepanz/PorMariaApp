import 'package:por_maria_app/models/group_model.dart';
import 'package:por_maria_app/models/position_model.dart';

class MembershipModel {
  int id;

  GroupModel group;

  PositionModel position;

  String creationDate;

  bool active;

  String disabledDate;

  MembershipModel(
      {required this.id,
      required this.group,
      required this.position,
      required this.creationDate,
      required this.active,
      required this.disabledDate});

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    return MembershipModel(
      id: json['id'] as int? ?? 95,
      position: PositionModel.fromJson(
          json['civilStatus'] as Map<String, dynamic>? ?? Map()),
      active: json['active'] as bool? ?? false,
      creationDate: json['creationDate'] as String? ?? "",
      // Usar operador nulo para manejar valores nulos en el JSON
      disabledDate: json['disabledDate'] as String? ?? "",
      group: GroupModel.fromJson(
          json['civilStatus'] as Map<String, dynamic>? ?? Map()),
    );
  }
}
