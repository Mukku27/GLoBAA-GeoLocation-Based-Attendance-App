import 'package:flutter/material.dart';
import '../Manager/main_screen.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  final String imagePath;

  LoginScreen({required this.title, required this.imagePath});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 85),
                      Image.asset(
                        widget.imagePath,
                        height: 150,
                      ),
                      SizedBox(height: 85),
                      Align(
                        alignment:
                            Alignment.centerLeft, // Aligns the text to the left
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1c1f26),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        style: TextStyle(
                          fontSize: 18.0, // Sets the font size
                          fontWeight: FontWeight.w500, // Sets the font weight
                          color: Color(0xFFA5A5A5), // Sets the font color
                        ),
                        cursorColor: Color(0xFFA5A5A5),
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFA5A5A5), // Set the border color on focus
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 18.0, // Sets the font size
                          fontWeight: FontWeight.w500, // Sets the font weight
                          color: Color(0xFFA5A5A5), // Sets the font color
                        ),
                        cursorColor: Color(0xFFA5A5A5),
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Color(
                                  0xFFA5A5A5), // Set the border color on focus
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                activeColor: Color(
                                    0xFF1cbeca), // Background color when checked
                                checkColor: Color(0xFFFFFFFF),
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                'Remember',
                                style: TextStyle(color: Color(0xFF666666)),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Add forget password logic
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(color: Color(0xFF666666)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF105f82),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 251, 251, 251)),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add create account logic
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
