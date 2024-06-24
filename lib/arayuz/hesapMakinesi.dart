import 'package:flutter/material.dart';
import 'dart:math';

class containerApp extends StatefulWidget {
  @override
  State<containerApp> createState() => _containerAppState();
}

class _containerAppState extends State<containerApp> {
  num a = 0;
  int islem = 0;
  String hesap = "";
  String ongoru = "";

  void hesapDegistir(String x) {
    setState(() {
      ongoru += x;
      hesap += x;
    });
  }

  void ce() {
    setState(() {
      hesap = "";
      ongoru = "";
    });
  }

  void sil() {
    setState(() {
      hesap = hesap.substring(0, hesap.length - 1);
      ongoru = ongoru.substring(0, ongoru.length - 1);
    });
  }

  void donustur(int gelen) {
    a = num.parse(hesap);
    islem = gelen;
    setState(() {
      ongoru = "";
      switch (islem) {
        case 0:
          break;
        case 1:
          setState(() {
            ongoru += hesap + "+";
          });
          break;
        case 2:
          setState(() {
            ongoru += hesap + "-";
          });
          break;
        case 3:
          setState(() {
            ongoru += hesap + "*";
          });
          break;
        case 4:
          setState(() {
            ongoru += hesap + "/";
          });
          break;
        case 5:
          setState(() {
            ongoru += hesap + "^";
          });
          break;
        case 6:
          setState(() {
            ongoru += hesap + "√";
          });
          break;
      }
      hesap = "";
    });
  }

  void hesapla(int islem) {
    switch (islem) {
      case 0:
        break;
      case 1:
        setState(() {
          num b = num.parse(hesap);
          a = (a + b);
          hesap = a.toString();
          ongoru = "";
          a = 0;
        });
        break;
      case 2:
        setState(() {
          num b = num.parse(hesap);
          a = (a - b);
          hesap = a.toString();
          ongoru = "";
          a = 0;
        });
        break;
      case 3:
        setState(() {
          num b = num.parse(hesap);
          a = (a * b);
          hesap = a.toString();
          ongoru = "";
          a = 0;
        });
        break;
      case 4:
        setState(() {
          num b = num.parse(hesap);
          a = (a / b);
          hesap = a.toString();
          ongoru = "";
          a = 0;
        });
        break;
      case 5:
        setState(() {
          int b = int.parse(hesap);
          num c = pow(a, b);
          hesap = c.toString();
          ongoru = "";
        });
        break;
      case 6:
        setState(() {
          hesap = sqrt(a).toString();
          ongoru = "";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Makinesi"),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: TextDirection.ltr,
        verticalDirection: VerticalDirection.down,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.blueGrey.shade200,
              width: ((MediaQuery.sizeOf(context).width) / 100) * 100,
              height: ((MediaQuery.sizeOf(context).height) / 100) * 41.1,
              child: Container(
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(2, 2, 2, 25),
                    color: Colors.blueGrey.shade50,
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                textDirection: TextDirection.ltr,
                                verticalDirection: VerticalDirection.down,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    ongoru,
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                textDirection: TextDirection.ltr,
                                verticalDirection: VerticalDirection.down,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(hesap,
                                      style: TextStyle(fontSize: 100),
                                      textAlign: TextAlign.right),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(
          //   height: ((MediaQuery.sizeOf(context).height) / 100) * 4,
          // ),

          Expanded(
              child: Container(
            color: Colors.black,
            child: Column(children: [
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("1"),
                          child: const Text(
                            "1",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("2"),
                          child: const Text(
                            "2",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("3"),
                          child: const Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.44),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(1),
                          child: const Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          6),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => ce(),
                          child: const Text(
                            "CE",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("4"),
                          child: const Text(
                            "4",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.4),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("5"),
                          child: const Text(
                            "5",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.4),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("6"),
                          child: const Text(
                            "6",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.9),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(2),
                          child: const Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.8),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(5),
                          child: const Text(
                            "^",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("7"),
                          child: const Text(
                            "7",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("8"),
                          child: const Text(
                            "8",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.53),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("9"),
                          child: const Text(
                            "9",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.53),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(3),
                          child: const Text(
                            "*",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.53),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(6),
                          child: const Text(
                            "√",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          9),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("."),
                          child: const Text(
                            ".",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () => hesapDegistir("0"),
                          child: const Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.black,
                        child: IconButton(
                          icon: Icon(
                            Icons.backspace,
                            color: Colors.white,
                          ),
                          onPressed: sil,
                        ),
                      )),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.6),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => donustur(4),
                          child: const Text(
                            "/",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical:
                                      ((MediaQuery.sizeOf(context).height) /
                                              100) *
                                          4.57,
                                  horizontal:
                                      ((MediaQuery.sizeOf(context).width) /
                                              100) *
                                          8.5),
                            ),
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black87),
                          ),
                          onPressed: () => hesapla(islem),
                          child: const Text(
                            "=",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
              ),
            ]),
          ))
        ],
      ),
    );
  }
}
