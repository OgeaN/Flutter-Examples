import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogsPage extends StatefulWidget {
  @override
  _CallLogsPageState createState() => _CallLogsPageState();
}

class _CallLogsPageState extends State<CallLogsPage> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    checkPermissionStatus();
  }

  Future<void> checkPermissionStatus() async {
    final status = await Permission.phone.status;
    if (status == PermissionStatus.granted) {
      Navigator.pushNamed(context, "/scaff");
    }
    setState(() {
      _permissionStatus = status;
    });
  }

  Future<void> requestPermission() async {
    final result = await Permission.phone.request();
    checkPermissionStatus();
    setState(() {
      _permissionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arama Kayıtları İzni'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Arama Kayıtları İzni Durumu:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _permissionStatus.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => requestPermission(),
              child: Text('İzin İste'),
            ),
          ],
        ),
      ),
    );
  }
}
