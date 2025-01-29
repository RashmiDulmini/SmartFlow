import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smartflow/home_page.dart';

class DailyConsumption extends StatefulWidget {
  const DailyConsumption({super.key});

  @override
  State<DailyConsumption> createState() => _DailyConsumptionState();
}

class _DailyConsumptionState extends State<DailyConsumption> {
  // Firebase database reference
  final DatabaseReference _waterFlowRef = FirebaseDatabase.instance.ref('WaterFlow');

  // Variables to hold the values
  String totalVolume = "Loading...";
  String flowRate = "Loading...";

  // Initial operations when open the page
  @override
  void initState() {
    super.initState();

    // Listen for changes in the 'WaterFlow' node in real time db
    _waterFlowRef.onValue.listen((event) {
      final data = event.snapshot.value;

      if (data != null && data is Map) {
        // Safely extract TotalVolume and FlowRate
        setState(() {
          totalVolume = data['TotalVolume'] != null ? data['TotalVolume'].toString() : "Not Available";
          flowRate = data['FlowRate'] != null ? data['FlowRate'].toString() : "Not Available";
        });
      } else {
        setState(() {
          totalVolume = "Data not available";
          flowRate = "Data not available";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF204B8A),
        foregroundColor: Colors.white,
        title: const Text("Consumption Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(35),
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF5787CA), width: 2),  // border color and width
                borderRadius: BorderRadius.circular(12),  // rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Daily Consumption',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    totalVolume,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'Flow rate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    flowRate,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "")),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF204B8A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // rounded corners
                ),
              ),
              child: const Text('See Your History', style: TextStyle(fontSize: 16),),
            )

          ],
        ),
      ),
    );
  }
}

