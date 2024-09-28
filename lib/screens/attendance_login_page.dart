import 'package:flutter/material.dart';
import 'login_screen.dart';

class AttendanceLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Apply LinearGradient to the background
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Image.asset(
                        'assets/logo_atd.png',
                        width: 125.0, // Set the width
                        height: 125.0, // Set the height
                        fit: BoxFit
                            .fitHeight, // Adjust how the image fills the area
                      ),
                      SizedBox(height: 60),
                      Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1e6889),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildLoginOption(
                  context: context,
                  title: 'MANAGER',
                  imagePath: 'assets/manager_icon.png',
                ),
                SizedBox(height: 25),
                _buildLoginOption(
                  context: context,
                  title: 'EMPLOYEE',
                  imagePath: 'assets/employee_icon.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginOption({
    required BuildContext context,
    required String title,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(
              title: '$title LOGIN',
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        height: 200.0, // Set height
        width: 250.0, //set width
        decoration: BoxDecoration(
          color: Color(0xFFe7eff3), // Cream color background
          borderRadius: BorderRadius.circular(20.0), // Set the border radius
        ),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers items vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centers items horizontally
            children: [
              Image.asset(
                imagePath,
                height: 120,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1e6889),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
