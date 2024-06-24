import 'package:flutter/material.dart';
import 'package:flutter_application_1/arayuz/hesapMakinesi.dart';
import 'package:flutter_application_1/arayuz/sayiArtir.dart';
import 'package:flutter_application_1/arayuz/anaMenu.dart';
import 'package:flutter_application_1/arayuz/aramalar.dart';
import 'package:flutter_application_1/HiveYapisi/yemek.dart';
import 'package:flutter_application_1/restApi/rest_home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'arayuz/callogs.dart';
import 'HiveYapisi/hiveArayuz.dart';
import 'arayuz/kamera_izin.dart';

import 'arayuz/scroll.dart';
import 'arayuz/veriDeneme.dart';

DateTime? lastpressed;
void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(YemekAdapter());
  await Hive.openBox<Yemek>('yemekBox');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastpressed == null || now.difference(lastpressed!) > maxDuration;
          if (isWarning) {
            lastpressed = DateTime.now();
            Fluttertoast.showToast(
                msg: "Çıkmak için iki kere basınız",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          } else {
            return true;
          }
        },
        child: MyWidget(),
      ),
      initialRoute: "/",
      routes: {
        "/ikinciSyfa": (context) => containerApp(),
        "/degisen": (context) => degisenWidget(),
        "/scrollSayfa": (context) => scrollApp(),
        "/jasonaGit": (context) => jsonOrnek(),
        "/kamera": (context) => CameraPermissionPage(),
        "/scaff": (context) => CallLogPage(),
        "/call": (context) => CallLogsPage(),
        "/hive": (context) => hiveData(),
        "/restHome": (context) => restHome(),
      },
    ),
  );
}
