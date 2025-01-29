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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF204B8A),

        centerTitle: true,
        title: const Text('SMART FLOW', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/water_2.jpg'),

            const SizedBox(height: 50), // Add space between image and button

            // Navigate to the Daily Consumption page
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DailyConsumption()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF204B8A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // rounded corners
                ),

                minimumSize: Size(200,45)
              ),
              child: const Text('Get Started', style: TextStyle(fontSize: 17),),
            ),
          ],
        ),
      ),
    );
  }
}

