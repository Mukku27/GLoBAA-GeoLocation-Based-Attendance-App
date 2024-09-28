import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import AppDrawer for the drawer

class RecordScreen extends StatelessWidget {
  final String date;
  final String inTime;
  final String outTime;
  final String totalTime;

  const RecordScreen({
    Key? key,
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Record'),
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
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Add the drawer here
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            color: Color(0xFF1e6889),
            child: Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRecordRow('In time', inTime),
                SizedBox(height: 10),
                buildRecordRow('Out time', outTime),
                SizedBox(height: 10),
                buildRecordRow('Total time', totalTime),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecordRow(String label, String value) {
    return Container(
      color: Color(0xFF1e6889),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
