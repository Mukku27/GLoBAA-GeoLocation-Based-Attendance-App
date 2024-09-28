import 'package:flutter/material.dart';
import 'permissions_screen.dart';
import 'history_screen.dart';
import 'location_selection_screen.dart';

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
                  width: 70.0, // Adjust width to fit inside the circle
                  height: 70.0, // Adjust height to fit inside the circle
                  fit: BoxFit.contain, // Ensures the image fits properly
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
          _buildDrawerItem(context, 'Manual Attendance', Icons.check_circle,
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationSelectionScreen(),
              ),
            );
          }),
          _buildDrawerItem(context, 'Contact', Icons.phone, () {
            // Handle Contact
          }),
          _buildDrawerItem(context, 'Logout', Icons.exit_to_app, () {
            // Handle Logout
          }),
        ],
      ),
    );
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
