import 'package:por_maria_app/models/person_contact_type_model.dart';
import 'package:por_maria_app/models/person_model.dart';

class PersonContactModel {
  int id;
  String value;
  PersonContactTypeModel contactType;
  PersonModel person;
  String creationDate;
  String additionalValue;

  PersonContactModel(
      {required this.id,
      required this.value,
      required this.contactType,
      required this.person,
      required this.creationDate,
      required this.additionalValue});

  factory PersonContactModel.fromJson(Map<String, dynamic> json) {
    return PersonContactModel(
        id: json["id"] as int? ?? 96,
        value: json["value"] as String? ?? "",
        contactType: PersonContactTypeModel.fromJson(
            json["contactType"] as Map<String, dynamic>? ?? Map()),
        creationDate: json["creationDate"] as String? ?? "",
        person: PersonModel.fromJson(
            json["person"] as Map<String, dynamic>? ?? Map()),
        additionalValue: json["additionalValue"] as String? ?? "");
  }
}
