import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class jsonOrnek extends StatefulWidget {
  const jsonOrnek({super.key});

  @override
  State<jsonOrnek> createState() => _jsonOrnekState();
}
/*{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
 */

class veri {
  int userId;
  int id;
  String title;
  String body;

  veri(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory veri.fromJson(Map<String, dynamic> json) {
    return veri(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

Future<List<veri>> veriGetir() async {
  var result =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  if (result.statusCode == 200) {
    var data = json.decode(result.body) as List<dynamic>;
    List<veri> veriler = data.map((item) => veri.fromJson(item)).toList();
    return veriler;
  } else {
    throw Exception("Veriler alınamadı: ${result.statusCode}.");
  }
}

class _jsonOrnekState extends State<jsonOrnek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Veri Alma"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade100,
        child: FutureBuilder<List<veri>>(
          future: veriGetir(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Hata Oluştu ${snapshot.error}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.red.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "User ID: ${snapshot.data![index].userId}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "ID: ${snapshot.data![index].id}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Title: ${snapshot.data![index].title}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Body: ${snapshot.data![index].body}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text("Veri Yok");
            }
          },
        ),
      ),
    );
  }
}
