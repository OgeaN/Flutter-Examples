import 'package:flutter_application_1/restApi/model/person_dob.dart';
import 'package:flutter_application_1/restApi/model/person_name.dart';

class Person {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final PersonName name;
  final PersonDob dob;

  Person({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
  });

  String get fullName {
    return "${name.title}.${name.first} ${name.last}";
  }
}
