import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FE),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Text("Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  CircleAvatar(
                    backgroundColor: Color(0xFF1B0A46),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Profile Picture
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg'), // Ganti sesuai path kamu
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFF1B0A46),
                      child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("Full Name"),
                    _buildInputField(hintText: "Ferdy Salsabilla"),
                    SizedBox(height: 20),
                    _buildLabel("Email Address"),
                    _buildInputField(hintText: "ferdysalsabilla87@gmail.com"),
                    SizedBox(height: 20),
                    _buildLabel("Password"),
                    _buildInputField(hintText: "••••••••", obscureText: true),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ), // Bottom Navigation
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15));
  }

  Widget _buildInputField({required String hintText, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
