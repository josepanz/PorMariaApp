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

  PersonModel({
    required this.id,
    required this.names,
    required this.civilStatus,
    required this.active,
    required this.birthdate,
    required this.creationDate,
    required this.disabledDate,
    required this.personType,
    required this.lastNames,
    required this.personContact,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int? ?? 101,
      names: json['names'] as String? ?? "",
      civilStatus: CivilStatusModel.fromJson(
          json['civilStatus'] as Map<String, dynamic>? ?? Map()),
      active: json['active'] as bool? ?? false,
      birthdate: json['birthdate'] as String? ?? "",
      creationDate: json['creationDate'] as String? ?? "",
      // Usar operador nulo para manejar valores nulos en el JSON
      disabledDate: json['disabledDate'] as String? ?? "",
      personType: PersonTypeModel.fromJson(
          json['personType'] as Map<String, dynamic>? ?? Map()),
      lastNames: json['lastNames'] as String? ?? "",
      // Usar operador nulo para manejar valores nulos en el JSON
      personContact: (json['personContact'] as List<dynamic>?)
              ?.map((contact) => PersonContactModel.fromJson(
                  contact as Map<String, dynamic>? ?? Map()))
              .toList() ??
          [],
    );
  }
}
