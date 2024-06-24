import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionPage extends StatefulWidget {
  @override
  _CameraPermissionPageState createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionPage> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    checkPermissionStatus();
  }

  Future<void> checkPermissionStatus() async {
    final status = await Permission.camera.status;
    setState(() {
      _permissionStatus = status;
    });
  }

  Future<void> requestPermission() async {
    final result = await Permission.camera.request();
    setState(() {
      _permissionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamera İzni'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kamera İzni Durumu:',
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
