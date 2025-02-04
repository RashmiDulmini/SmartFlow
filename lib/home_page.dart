import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDate;
  final DatabaseReference _historyRef = FirebaseDatabase.instance.ref('WaterFlow/History');
  double? _lastTotalVolume;
  bool _isLoading = false;

  // Function to fetch the last recorded total volume for the selected date
  void _fetchHistory() async {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a date")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _lastTotalVolume = null;
    });

    String selectedDateString =
        "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}";

    try {
      DatabaseEvent event = await _historyRef.once();
      Map<dynamic, dynamic>? historyMap = event.snapshot.value as Map<dynamic, dynamic>?;

      if (historyMap != null) {
        List<MapEntry<String, dynamic>> matchingEntries = [];

        for (var entry in historyMap.entries) {
          String key = entry.key;
          Map<dynamic, dynamic> data = entry.value;

          if (key.startsWith(selectedDateString)) {
            matchingEntries.add(MapEntry(key, Map<String, dynamic>.from(data)));
          }
        }

        if (matchingEntries.isNotEmpty) {
          // Sort by key (timestamp order) and get the last entry
          matchingEntries.sort((a, b) => a.key.compareTo(b.key));
          Map<String, dynamic> lastEntry = matchingEntries.last.value;

          setState(() {
            _lastTotalVolume = lastEntry['TotalVolume']?.toDouble();
            _isLoading = false;
          });
          return;
        }
      }

      // No data found for the selected date
      setState(() {
        _isLoading = false;
        _lastTotalVolume = null;
      });
    } catch (e) {
      print("Error fetching history: $e");
      setState(() {
        _isLoading = false;
        _lastTotalVolume = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF204B8A),
        foregroundColor: Colors.white,
        title: const Text(
          'View History',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(35),
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white, // Container background color
                border: Border.all(color: const Color(0xFF5787CA), width: 2),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF204B8A).withOpacity(0.3), // Blue shadow color
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(3, 6), // Shadow direction
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select the date to view water consumption',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  // Select Date
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
                          _selectedDate = picked;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF204B8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Select the Date'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _selectedDate != null ? 'Selected Date: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}' : '',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 20),

                  // Fetch Data Button
                  ElevatedButton(
                    onPressed: _fetchHistory,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF204B8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Fetch Data'),
                  ),

                  const SizedBox(height: 20),

                  // Display Data Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF5787CA), width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white, // Background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(3, 6), // Shadow direction
                        ),
                      ],
                    ),
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _lastTotalVolume == null
                            ? const Center(
                                child: Text(
                                  'No Data Available for Selected Date',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Daily Water Consumption: $_lastTotalVolume L",
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
