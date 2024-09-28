import 'package:flutter/material.dart';
import '../screens/attendance_login_page.dart'; // Import the attendance login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendanceLoginPage(), // Ensure this class is imported properly
    );
  }
}
