import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/restApi/model/person.dart';

class PieChartSample2 extends StatefulWidget {
  final List<Person> person;
  PieChartSample2({Key? key, required this.person}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  double genc = 0;
  double yetiskin = 0;
  double ortaYasli = 0;
  double yasli = 0;

  double yuzdeHesap(double tur) {
    double toplam = genc + yetiskin + ortaYasli + yasli;

    return (tur / toplam) * 100;
  }

  Future<void> someFunction() async {
    List<Person> personList = widget.person;
    yetiskin = 0;
    genc = 0;
    ortaYasli = 0;
    yasli = 0;
    print(personList.length);
    for (var persons in personList) {
      int age = persons.dob.age;
      print("age:$age");
      print("$genc, $yetiskin, $ortaYasli, $yasli");
      if (age <= 25) {
        genc++;
      } else if (age > 25 && age <= 40) {
        yetiskin++;
      } else if (age > 40 && age < 55) {
        ortaYasli++;
      } else if (age >= 55) {
        yasli++;
      }
    }
    print("$genc, $yetiskin, $ortaYasli, $yasli");
  }

  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    someFunction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: someFunction(),
      builder: (context, snapshot) {
        return AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              Expanded(
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          shape: BoxShape.circle,
                          color: Colors.blue.shade400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Genç",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          shape: BoxShape.circle,
                          color: Colors.green.shade400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Yaşlı",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          shape: BoxShape.circle,
                          color: Colors.yellow.shade400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Yetişkin",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          shape: BoxShape.circle,
                          color: Colors.purple.shade400,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Orta Yaşlı",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 32.0 : 20.0;
      final radius = isTouched ? 70.0 : 60.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue.shade500,
            value: genc,
            title: "%" + yuzdeHesap(genc).toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red.shade500,
            value: yetiskin,
            title: "%" + yuzdeHesap(yetiskin).toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple.shade500,
            value: ortaYasli,
            title: "%" + yuzdeHesap(ortaYasli).toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green.shade500,
            value: yasli,
            title: "%" + yuzdeHesap(yasli).toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
