import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text (
              'Water Consumption within the time frame you need',
              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _startDate = picked;
                  });
                }
              },
              child: const Text('Select Start Date'),
            ),
            const SizedBox(height: 20),
            Text(_startDate != null ? 'Start Date: ${_startDate!.toString()}' : ''),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _endDate = picked;
                  });
                }
              },
              child: const Text('Select End Date'),
            ),
            const SizedBox(height: 20),
            Text(_endDate != null ? 'End Date: ${_endDate!.toString()}' : ''),
            const SizedBox(height: 20),

            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: const Center(
                child: Text('Display Data Here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}