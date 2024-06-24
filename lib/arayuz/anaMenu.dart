import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Anasayfa"),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/ikinciSyfa");
                Fluttertoast.showToast(
                    msg: "Hesap Makinesi Açildi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/hesapMakinesi.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Hesap Makinesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/jasonaGit");
                Fluttertoast.showToast(
                    msg: "Veriler Menüsüne Gidiliyor",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blueGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/json.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Json Veri",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/call");
                Fluttertoast.showToast(
                    msg: "Son Aramalar Açildi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/phone.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Arama Kayıtları",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/hive");
                Fluttertoast.showToast(
                    msg: "Yemek Tarifleri Açılıyor",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/yemek.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Yemek Tarifleri",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/restHome");
                Fluttertoast.showToast(
                    msg: "Yaş Dağılımları Açılıyor",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/pieChart.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Yaş Dağılımları",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/ikinciSyfa");
                Fluttertoast.showToast(
                    msg: "Hesap Makinesi Açildi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/hesapMakinesi.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Hesap Makinesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/ikinciSyfa");
                Fluttertoast.showToast(
                    msg: "Hesap Makinesi Açildi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/hesapMakinesi.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Hesap Makinesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/ikinciSyfa");
                Fluttertoast.showToast(
                    msg: "Hesap Makinesi Açildi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photos/hesapMakinesi.png"),
                        fit: BoxFit.fill)),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: const Text(
                    "Hesap Makinesi",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.amber,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (int i) {
            switch (i) {
              case 0:
                debugPrint("0");
                break;
              case 1:
                Navigator.pushNamed(context, "/degisen");
                break;
              case 2:
                debugPrint("0");
                break;
              case 3:
                debugPrint("0");
                break;
            }
          }),
      drawer: Drawer(
        backgroundColor: Colors.amber.shade300,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: Colors.black, width: 2.5),
                ),
                color: Colors.amber.shade300,
              ),
              child: const Center(
                child: Text(
                  'Seçenekler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: ListTile(
                tileColor: Color.fromARGB(255, 203, 187, 139),
                focusColor: const Color.fromARGB(255, 203, 187, 139),
                contentPadding: EdgeInsets.only(top: 10),
                leading: Icon(Icons.mouse_rounded),
                title: Text(
                  "Scroll Sayfa Örneği",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/scrollSayfa");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 10),
                tileColor: Color.fromARGB(255, 203, 187, 139),
                focusColor: const Color.fromARGB(255, 203, 187, 139),
                leading: Icon(Icons.camera_alt),
                title: Text("Kamera İzin Örnek Sayfa"),
                onTap: () {
                  Navigator.pushNamed(context, "/kamera");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 10),
                tileColor: Color.fromARGB(255, 203, 187, 139),
                focusColor: const Color.fromARGB(255, 203, 187, 139),
                leading: new Icon(Icons.announcement_sharp),
                title: Text("Bildirimler"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
