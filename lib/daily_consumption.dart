import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smartflow/home_page.dart';

class DailyConsumption extends StatefulWidget {
  const DailyConsumption({super.key});

  @override
  State<DailyConsumption> createState() => _DailyConsumptionState();
}

class _DailyConsumptionState extends State<DailyConsumption> {
  // Firebase Realtime Database reference
  final DatabaseReference _waterFlowRef =
      FirebaseDatabase.instance.ref('WaterFlow');

  // Variables to hold real-time values
  String totalVolume = "Loading...";
  String flowRate = "Loading...";

  @override
  void initState() {
    super.initState();

    _listenForWaterFlowUpdates();
  }

  void _listenForWaterFlowUpdates() {
  _waterFlowRef.onValue.listen((DatabaseEvent event) {
    if (event.snapshot.value != null) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        totalVolume = data['TotalVolume']?.toString() ?? "Not Available";
        flowRate = data['FlowRate']?.toString() ?? "Not Available";
      });
    } else {
      setState(() {
        totalVolume = "Data not available";
        flowRate = "Data not available";
      });
    }
  }, onError: (error) {
    print("Firebase Error: $error");
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF204B8A),
        foregroundColor: Colors.white,
        title: const Text(
          "Consumption Details",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
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
                border: Border.all(color: const Color(0xFF5787CA), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Daily Consumption',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    totalVolume,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Flow Rate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    flowRate,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: "")),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF204B8A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'See Your History',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
