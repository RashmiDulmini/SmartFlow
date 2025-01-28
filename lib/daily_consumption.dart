import 'package:flutter/material.dart';
import 'package:smartflow/home_page.dart';

class DailyConsumption extends StatefulWidget {
  const DailyConsumption({super.key});

  @override
  State<DailyConsumption> createState() => _DailyConsumptionState();
}

class _DailyConsumptionState extends State<DailyConsumption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Consumption"),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(""),
            ElevatedButton(
              onPressed: () {

                // Navigate to the home page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "")),
                );
              },
              child: const Text('See Your History'),
            ),
          ],
        ),
      ),
    );
  }
}
