import 'package:flutter/material.dart';
import 'package:gsou/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GSou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.yellow
      ),
      home: const HomePage(),
    );
  }
}


