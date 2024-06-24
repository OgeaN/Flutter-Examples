import 'package:flutter/material.dart';
import 'package:flutter_application_1/restApi/model/person.dart';

import 'package:flutter_application_1/restApi/pie_charts/pie_charts.dart';
import 'package:flutter_application_1/restApi/services/person_api.dart';

class restHome extends StatefulWidget {
  const restHome({super.key});

  @override
  State<restHome> createState() => restHomeState();
}

class restHomeState extends State<restHome> {
  List<Person> person = [];
  bool isLoading = true;

  Future<void> fetchUser() async {
    try {
      List<Person> response = await PersonApi.fetchUser();
      setState(() {
        person = response;
        isLoading = false;
      });
    } catch (e) {
      print('Veri çekilirken hata oluştu: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    if (person.isEmpty) {
      print("person ${person.length}");
      setState(() {
        fetchUser();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yaş Dağılımı"),
        backgroundColor: Colors.tealAccent.shade400,
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white60,
                width: 2,
              ),
              color: Colors.purple.shade100),
          child: PieChartSample2(
            person:
                person, // person, restHomeState içindeki 'person' listesidir.
          ),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: Card(
        //           child: Container(
        //             height: 120,
        //             color: Colors.amber.shade600,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: Card(
        //           child: Container(
        //             height: 120,
        //             color: Colors.amber.shade600,
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        Expanded(
          child: Container(
              color: Colors.purple.shade100,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: person.length,
                      itemBuilder: (context, index) {
                        final persons = person[index];
                        return Card(
                          color: Colors.white70,
                          child: ListTile(
                            title: Text(persons.fullName),
                            subtitle: Text(
                                persons.gender == "male" ? "Erkek" : "Kadın"),
                            trailing: Text("Yaş:${persons.dob.age}"),
                          ),
                        );
                      })),
        )
      ]),
    );
  }
}

// FutureBuilder<List<Person>>(
//           future: PersonApi.fetchUser(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return ListView.builder(
//                 itemCount: person.length,
//                 itemBuilder: (context, index) {
//                   final persons = person[index];

//                   return ListTile(
//                     title: Text(persons.dob.age.toString()),
//                   );
//                 });
//           },
//         )

/*Column(children: [
        SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            height: 140,
            color: Colors.amber,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Container(
                    height: 120,
                    color: Colors.amber.shade600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Container(
                    height: 120,
                    color: Colors.amber.shade600,
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Card(
              child: Container(
            height: MediaQuery.sizeOf(context).height / 100 * 50,
            color: Colors.purple.shade200,
          )),
        )
      ]), */