import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartflow/firebase_options.dart';
import 'package:smartflow/get_started.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Use the generated options for platform-specific configuration
  );

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
      home:const GetStarted(),
    );
  }
}

