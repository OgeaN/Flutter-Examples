import 'package:flutter/material.dart';

class degisenWidget extends StatefulWidget {
  const degisenWidget({super.key});

  @override
  State<degisenWidget> createState() => _degisenWidgetState();
}

class _degisenWidgetState extends State<degisenWidget> {
  int sayi = 0;
  void artir() {
    setState(() {
      sayi++;
    });
  }

  void dusur() {
    setState(() {
      sayi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text("Değişen Sayfa"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      textAlign: TextAlign.right,
                      "Sayi: $sayi",
                      style: TextStyle(
                        color: sayi < 0 ? Colors.red : Colors.green,
                        fontSize: 50,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                        ),
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                      ),
                      onPressed: dusur,
                      child: const Text(
                        "---",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20, horizontal: 75),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                      ),
                      child: Text(
                        "+++",
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: artir,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
