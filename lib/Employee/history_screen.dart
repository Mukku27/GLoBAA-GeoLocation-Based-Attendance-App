import 'package:flutter/material.dart';
import 'dart:math'; // For generating random times
import 'app_drawer.dart'; // Import AppDrawer
import 'record_screen.dart'; // Import the record screen

class HistoryScreen extends StatelessWidget {
  // Function to generate a list of 30 dates in September
  List<Map<String, String>> generateRandomHistory() {
    List<Map<String, String>> historyData = [];

    for (int i = 1; i <= 30; i++) {
      String date = '${i}th Sep, 2023';
      
      // Generate random inTime and outTime
      Random random = Random();
      int inHour = 8 + random.nextInt(3); // In time between 8:00 AM to 10:00 AM
      int inMinute = random.nextInt(60);
      String inTime = '${inHour}:${inMinute.toString().padLeft(2, '0')} AM';

      int outHour = 4 + random.nextInt(4) + 12; // Out time between 4:00 PM to 7:00 PM
      int outMinute = random.nextInt(60);
      String outTime = '${outHour}:${outMinute.toString().padLeft(2, '0')} PM';

      // Calculate total time worked
      int totalMinutes = ((outHour - inHour) * 60 + (outMinute - inMinute));
      int totalHours = totalMinutes ~/ 60;
      int remainingMinutes = totalMinutes % 60;
      String totalTime = '${totalHours} hours ${remainingMinutes} minutes';

      // Add the record to the list
      historyData.add({
        'date': date,
        'inTime': inTime,
        'outTime': outTime,
        'totalTime': totalTime,
      });
    }

    return historyData;
  }

  @override
  Widget build(BuildContext context) {
    // Get the history data for 30 days of September
    List<Map<String, String>> history = generateRandomHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Color(0xFF1e6889),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Now works correctly
                },
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Add AppDrawer here
      body: ListView.builder(
        itemCount: history.length, // Display all 30 history items
        itemBuilder: (context, index) {
          // Get the record data for the current index
          final record = history[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordScreen(
                    date: record['date']!,
                    inTime: record['inTime']!,
                    outTime: record['outTime']!,
                    totalTime: record['totalTime']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Text(
                'Date: ${record['date']}', // Display dynamic date
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

