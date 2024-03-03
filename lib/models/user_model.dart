import 'package:por_maria_app/models/membership_model.dart';
import 'package:por_maria_app/models/person_model.dart';

class UserModel {
  int id;
  String code;
  String username;
  bool active;
  String creationDate;
  String disabledDate;
  PersonModel person;
  String password;
  List<MembershipModel> memberships;

  UserModel(
      {required this.id,
      required this.code,
      required this.username,
      required this.active,
      required this.creationDate,
      required this.disabledDate,
      required this.person,
      required this.password,
      required this.memberships});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 107,
      code: json['code'] as String? ?? "",
      username: json['username'] as String? ?? "",
      active: json['active'] as bool? ?? false,
      creationDate: json['creationDate'] as String? ?? "",
      disabledDate: json['disabledDate'] as String? ?? "",
      person: PersonModel.fromJson(
          json['person'] as Map<String, dynamic>? ?? Map()),
      password: json['password'] as String? ?? "",
      memberships: (json['membership'] as List<dynamic>?)
              ?.map((membership) => MembershipModel.fromJson(
                  membership as Map<String, dynamic>? ?? Map()))
              .toList() ??
          [],
    );
  }
}
