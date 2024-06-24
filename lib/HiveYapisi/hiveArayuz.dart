import 'package:flutter/material.dart';
import 'package:flutter_application_1/HiveYapisi/yemek.dart';
import 'package:hive_flutter/hive_flutter.dart';

class hiveData extends StatefulWidget {
  const hiveData({super.key});

  @override
  State<hiveData> createState() => _hiveDataState();
}

class _hiveDataState extends State<hiveData> {
  var myBox = Hive.box<Yemek>('yemekBox');
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController countryFromCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();
  TextEditingController ingredientsCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade200,
      appBar: AppBar(
        title: Text("Yemek Tarifleri"),
        backgroundColor: Colors.deepOrangeAccent.shade200,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Yemek Adı"),
                  controller: nameCtrl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Kökeni"),
                  controller: countryFromCtrl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Yapılış Süresi"),
                  controller: timeCtrl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "İçindekiler"),
                  controller: ingredientsCtrl,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepOrangeAccent.shade200),
                    ),
                    onPressed: () {
                      List<String> myIngredients =
                          ingredientsCtrl.text.split(",");
                      setState(() {
                        myBox.put(
                            'key_${nameCtrl.text}',
                            Yemek(
                                name: nameCtrl.text,
                                countryFrom: countryFromCtrl.text,
                                time: int.parse(timeCtrl.text),
                                ingredients: myIngredients));

                        nameCtrl.text = "";
                        countryFromCtrl.text = "";
                        timeCtrl.text = "";
                        ingredientsCtrl.text = "";
                      });
                    },
                    child: Icon(Icons.add))
              ]),
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            child: ListView.builder(
                itemCount: myBox.length,
                itemBuilder: (context, index) {
                  Yemek? yemek = myBox.getAt(index);
                  return GestureDetector(
                    onTap: () {
                      String ingredientsText = yemek.ingredients.join("\n");

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.deepOrangeAccent.shade200,
                              content: Container(
                                height: 150,
                                child: ListTile(
                                  title: Text(
                                    "İçindekiler:" + ingredientsText,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Card(
                      color: Colors.deepOrangeAccent.shade200,
                      child: ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              myBox.deleteAt(index);
                            });
                          },
                        ),
                        title: Text(yemek!.name),
                        subtitle: Text(yemek.countryFrom),
                        trailing: Text(yemek.time.toString() + "dk"),
                      ),
                    ),
                  );
                }),
          ),
        ))
      ]),
    );
  }
}
