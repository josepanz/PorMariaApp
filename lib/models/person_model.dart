import 'package:por_maria_app/models/civil_status_model.dart';
import 'package:por_maria_app/models/person_contact_model.dart';
import 'package:por_maria_app/models/person_type_model.dart';

class PersonModel {
  int id;
  String names;
  CivilStatusModel civilStatus;
  bool active;
  String birthdate;
  String creationDate;
  String disabledDate;
  PersonTypeModel personType;
  String lastNames;
  List<PersonContactModel> personContact;

  PersonModel(
      this.id,
      this.names,
      this.civilStatus,
      this.active,
      this.birthdate,
      this.creationDate,
      this.disabledDate,
      this.personType,
      this.lastNames,
      this.personContact);
}
