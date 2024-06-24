import 'dart:convert';
import 'package:flutter_application_1/restApi/model/person.dart';
import 'package:flutter_application_1/restApi/model/person_dob.dart';
import 'package:flutter_application_1/restApi/model/person_name.dart';

import 'package:http/http.dart' as http;

class PersonApi {
  static Future<List<Person>> fetchUser() async {
    print("ot");
    final url = "https://randomuser.me/api/?results=5000";
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;

    final transformed = results.map((e) {
      final name = PersonName(
          title: e["name"]["title"],
          first: e["name"]["first"],
          last: e["name"]["last"]);

      final dob = PersonDob(age: e["dob"]["age"]);
      return Person(
        gender: e["gender"],
        email: e["email"],
        phone: e["phone"],
        cell: e["cell"],
        nat: e["cell"],
        name: name,
        dob: dob,
      );
    }).toList();
    print("ot2");
    return transformed;
  }
}
