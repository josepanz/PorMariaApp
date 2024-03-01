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
  List<MembershipModel> membership;

  UserModel(this.id, this.code, this.username, this.active, this.creationDate,
      this.disabledDate, this.person, this.password, this.membership);
}
