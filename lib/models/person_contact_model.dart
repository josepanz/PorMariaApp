import 'package:por_maria_app/models/person_contact_type_model.dart';
import 'package:por_maria_app/models/person_model.dart';

class PersonContactModel {
  int id;
  String value;
  PersonContactTypeModel contactType;
  PersonModel person;
  String creationDate;
  String additionalValue;

  PersonContactModel(this.id, this.value, this.contactType, this.person,
      this.creationDate, this.additionalValue);
}
