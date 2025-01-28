import 'package:flutter/material.dart';
import 'package:smartflow/daily_consumption.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('    ...WELCOME TO THE SMART FLOW...'),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/water.jpg'),

          const SizedBox(height: 30), // Add space between image and button
          
          // Navigate to the Daily Consumption page
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DailyConsumption()),
              );
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

