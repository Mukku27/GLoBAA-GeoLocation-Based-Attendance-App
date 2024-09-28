import 'package:flutter/material.dart';
import 'dart:async'; // For the delayed logout
import 'permissions_screen.dart';
import 'history_screen.dart';
import 'location_selection_screen.dart';
import 'screens/attendance_login_page.dart'; // Import the login page

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer header
          Container(
            color: Color(0xFF105f82),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo_atd.png',
                  width: 70.0,
                  height: 70.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  "Company Name",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey[300]),

          // Drawer items
          _buildDrawerItem(context, 'Permissions', Icons.security, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PermissionsScreen(),
              ),
            );
          }),
          _buildDrawerItem(context, 'About Us', Icons.info, () {
            // Handle About Us
          }),
          _buildDrawerItem(context, 'History', Icons.history, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(),
              ),
            );
          }),
          _buildDrawerItem(context, 'Manual Attendance', Icons.check_circle, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationSelectionScreen(),
              ),
            );
          }),
          _buildDrawerItem(context, 'Contact', Icons.phone, () {
            _showContactInfo(context); // Show contact info when tapped
          }),
          _buildDrawerItem(context, 'Logout', Icons.exit_to_app, () {
            _handleLogout(context); // Handle logout with animation
          }),
        ],
      ),
    );
  }

  // Function to show contact info
  void _showContactInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Contact Us"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone: +123 456 7890'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email: contact@company.com'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address: 123 Company St, City, Country'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Function to handle logout with loading animation
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(), // Show circular loading indicator
        );
      },
    );

    // Simulate a delay for loading (e.g., 2 seconds), then redirect to login page
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close the loading dialog
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AttendanceLoginPage()),
      );
    });
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
