import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import AppDrawer for the drawer
import 'employee_screen.dart';

class EmployeeData extends StatefulWidget {
  @override
  _EmployeeDataState createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  int? selectedEmployee; // Track the selected employee

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e6889),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Employee Data"),
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
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // one column
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 5, // Adjust the height/width ratio of items
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedEmployee = index + 1; // Update selected employee
              });

              // Navigate to EmployeeScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EmployeeScreen(), // Navigate to EmployeeScreen
                ),
              );
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300), // Smooth transition
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: selectedEmployee == index + 1
                    ? LinearGradient(
                        colors: [
                          Color(0xFF1e6889)!,
                          Color.fromARGB(255, 21, 143, 199)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null, // Set gradient for selected card
                color: selectedEmployee == index + 1
                    ? null
                    : Colors.white, // Set white for unselected cards
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  'Employee-${index + 1}',
                  style: TextStyle(
                    fontSize: 20,
                    color: selectedEmployee == index + 1
                        ? Colors.white
                        : Color(0xFF1e6889),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
