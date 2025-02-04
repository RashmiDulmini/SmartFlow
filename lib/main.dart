import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartflow/firebase_options.dart';
import 'package:smartflow/get_started.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCXDIZpz1__Ew-9dKAR409Nb1OvpbkK9aE", 
      appId: "1:633767430031:android:bff429c63d03a1377cedfa", 
      messagingSenderId: "633767430031", 
      projectId: "smartflow-90170",
      authDomain: "smartflow-90170.firebaseapp.com",
      databaseURL: "https://smartflow-90170-default-rtdb.firebaseio.com",
      storageBucket: "smartflow-90170.appspot.com",
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFlow',
      home:  GetStarted(), // Ensure GetStarted() exists
    );
  }
}
