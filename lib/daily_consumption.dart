import 'package:flutter/material.dart';

class DailyConsumption extends StatefulWidget {
  const DailyConsumption({super.key});

  @override
  State<DailyConsumption> createState() => _DailyConsumptionState();
}

class _DailyConsumptionState extends State<DailyConsumption> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Daily Water Consumption!"),
      ),
    );
  }
}