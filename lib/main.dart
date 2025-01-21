import 'package:flutter/material.dart';
import 'package:smartflow/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Consumption Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MyHomePage(title: ""),
    );
  }
}

