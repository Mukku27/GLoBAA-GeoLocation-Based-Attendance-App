import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import AppDrawer for the drawer
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

// Model class to represent hours spent per day
class DayHours {
  final String day;
  final int hoursSpent;

  DayHours(this.day, this.hoursSpent);
}

class EmployeeScreen extends StatefulWidget {
  EmployeeScreen({Key? key}) : super(key: key);

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  int _currentWeekIndex = 0;
  late List<charts.Series<DayHours, String>> _seriesList;
  DayHours? _selectedDayHours;

  @override
  void initState() {
    super.initState();
    _seriesList = _createSampleData(_currentWeekIndex);
  }

  // Method to create random data for two months
  List<charts.Series<DayHours, String>> _createSampleData(int weekIndex) {
    Random random = Random();
    List<List<DayHours>> weeksData = [];

    // Generating random data for 8 weeks (2 months)
    for (int i = 0; i < 8; i++) {
      weeksData.add([
        DayHours('Mon', random.nextInt(10)),
        DayHours('Tue', random.nextInt(10)),
        DayHours('Wed', random.nextInt(10)),
        DayHours('Thu', random.nextInt(10)),
        DayHours('Fri', random.nextInt(10)),
      ]);
    }

    // Return the data for the current week
    final currentWeekData = weeksData[weekIndex];

    return [
      charts.Series<DayHours, String>(
        id: 'Hours',
        domainFn: (DayHours day, _) => day.day, // X-axis value
        measureFn: (DayHours day, _) => day.hoursSpent, // Y-axis value
        data: currentWeekData,
        //labelAccessorFn: (DayHours day, _) => '${day.hoursSpent} hours',
        // insideLabelStyleAccessorFn: (_, __) => charts.TextStyleSpec(
        //fontSize: 12, // Size of the text in tooltip
        //color: charts.MaterialPalette.white,
      ),
    ];
  }

  void _navigateToPreviousWeek() {
    if (_currentWeekIndex > 0) {
      setState(() {
        _currentWeekIndex--;
        _seriesList = _createSampleData(_currentWeekIndex);
      });
    }
  }

  void _navigateToNextWeek() {
    if (_currentWeekIndex < 7) {
      setState(() {
        _currentWeekIndex++;
        _seriesList = _createSampleData(_currentWeekIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        backgroundColor: Color(0xFF1e6889),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(), // Add the drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Employee photo and name
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Employee Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Bar chart with navigation arrows and tooltip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _navigateToPreviousWeek,
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        charts.BarChart(
                          _seriesList,
                          animate: true,
                          barRendererDecorator:
                              charts.BarLabelDecorator<String>(),
                          domainAxis: const charts.OrdinalAxisSpec(),
                          behaviors: [
                            charts.SelectNearest(),
                            charts.DomainHighlighter(),
                          ],
                          selectionModels: [
                            charts.SelectionModelConfig(
                              type: charts.SelectionModelType.info,
                              changedListener:
                                  (charts.SelectionModel<String> model) {
                                if (model.hasDatumSelection) {
                                  final selectedDatum =
                                      model.selectedDatum.first.datum;
                                  setState(() {
                                    _selectedDayHours = selectedDatum;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        if (_selectedDayHours != null)
                          Positioned(
                            top: 10,
                            left: MediaQuery.of(context).size.width / 4,
                            child: Material(
                              elevation: 5,
                              color: Color(0xFF1e6889),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${_selectedDayHours!.hoursSpent} hours',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _navigateToNextWeek,
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Employee details with Employee ID at the top
            Expanded(
              child: ListView(
                children: [
                  detailItem('Employee ID', '12345', Icons.badge, Colors.black),
                  const SizedBox(height: 12),
                  detailItem('Location of Work', 'Hyderabad Office',
                      Icons.location_city, Colors.black),
                  const SizedBox(height: 12),
                  detailItem('Average Working Time', '8 hours/day',
                      Icons.access_time, Colors.black),
                  const SizedBox(height: 12),
                  contactDetailItem(
                    'Personal Email',
                    'MickeyMC@gmail.com',
                    Icons.email,
                    Colors.black,
                  ),
                  const SizedBox(height: 12),
                  contactDetailItem(
                    'Personal No.',
                    '(752) 592 7381',
                    Icons.phone,
                    Colors.black,
                  ),
                  const SizedBox(height: 12),
                  contactDetailItem(
                    'Work Email',
                    'mickey@apple.com',
                    Icons.email,
                    Colors.black,
                  ),
                  const SizedBox(height: 12),
                  contactDetailItem(
                    'Work No.',
                    '(802) 425 3807',
                    Icons.phone,
                    Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create detail items with icons (for Employee ID, Location, etc.)
  Widget detailItem(
      String label, String value, IconData icon, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // Method to create contact detail items
  Widget contactDetailItem(
      String label, String value, IconData icon, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
