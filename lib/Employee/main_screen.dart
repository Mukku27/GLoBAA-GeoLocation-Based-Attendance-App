import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'employee_screen.dart';
import 'history_screen.dart';
import 'location_selection_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        backgroundColor: Color(0xFF1e6889),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu), // App drawer icon
            onPressed: () => Scaffold.of(context).openDrawer(), // Open drawer
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // Person icon
            onPressed: () {
              // Navigate to Employee Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeScreen()),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Manual attendance button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationSelectionScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.list_alt,
                          color: Color(0xFF1e6889),
                          size: 48,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Manual attendance',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF1e6889),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // History button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.history,
                          color: Color(0xFF1e6889),
                          size: 48,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF1e6889),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
