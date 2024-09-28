import 'package:flutter/material.dart';
import 'app_drawer.dart'; // Import AppDrawer

class LocationSelectionScreen extends StatefulWidget {
  @override
  _LocationSelectionScreenState createState() =>
      _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose the location you are in:'),
        backgroundColor: Color(0xFF1e6889),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Builder(
            // Use Builder here to get a new context
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
      // Wrap GridView in ScrollConfiguration to customize scroll behavior
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(), // Custom scroll behavior
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // One column, full width
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            childAspectRatio: 6, // Adjust the height/width ratio of items
          ),
          physics: BouncingScrollPhysics(), // Smooth bouncing scroll effect
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedLocation = locations[index];
                });

                // Show pop-up dialog with the location name
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: EdgeInsets.zero,
                        content: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${locations[index]} location successfully added',
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: selectedLocation == locations[index]
                      ? LinearGradient(
                          colors: [Colors.yellow[700]!, Colors.orangeAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: selectedLocation == locations[index]
                      ? null
                      : Colors.white, // White background if not selected
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    locations[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: selectedLocation == locations[index]
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // List of locations
  final List<String> locations = [
    'Amaravathi',
    'Bengaluru',
    'Hyderabad',
    'Kolkata',
    'Chennai',
    'Mumbai',
    'Kakinada',
    'Vizag',
    'Trivandrum',
    'Nodia',
  ];
}

// Custom ScrollBehavior to remove glow and enable smooth scrolling
class MyCustomScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // Removes the default blue scroll glow on Android
  }
}
