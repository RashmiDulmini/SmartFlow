import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import firebase_core
import 'package:smartflow/get_started.dart';
import 'package:smartflow/home_page.dart';
import 'daily_consumption.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding before running app
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFlow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStarted(), // Your home page
    );
  }
}
