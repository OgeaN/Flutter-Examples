import 'package:flutter/material.dart';

class scrollApp extends StatelessWidget {
  const scrollApp({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text('Sağa Kaydırma Örneği'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              "Sağa doğru kaydırılacak metin",
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                "Sağa doğru kaydırılacak metin",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              "Sağa doğru kaydırılacak metin",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
