import 'package:flutter/material.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  // State for toggle switches
  bool isLocationEnabled = false;
  bool isBluetoothEnabled = false;
  bool isWifiEnabled = false;
  bool isStorageEnabled = false;
  bool isContactsEnabled = false;
  bool isMessagesEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
        backgroundColor: Color(0xFF1e6889),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPermissionToggle('Location', isLocationEnabled, (value) {
              setState(() {
                isLocationEnabled = value;
              });
            }),
            _buildPermissionToggle('Bluetooth', isBluetoothEnabled, (value) {
              setState(() {
                isBluetoothEnabled = value;
              });
            }),
            _buildPermissionToggle('Wifi', isWifiEnabled, (value) {
              setState(() {
                isWifiEnabled = value;
              });
            }),
            _buildPermissionToggle('Storage', isStorageEnabled, (value) {
              setState(() {
                isStorageEnabled = value;
              });
            }),
            _buildPermissionToggle('Contacts', isContactsEnabled, (value) {
              setState(() {
                isContactsEnabled = value;
              });
            }),
            _buildPermissionToggle('Messages', isMessagesEnabled, (value) {
              setState(() {
                isMessagesEnabled = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  // Helper method to build the toggle switch row
  Widget _buildPermissionToggle(
      String permission, bool currentValue, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            permission,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: currentValue,
            onChanged: onChanged,
            activeColor: Colors.yellow[700],
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
