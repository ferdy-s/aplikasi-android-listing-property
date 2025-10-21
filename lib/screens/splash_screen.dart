import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0A46), // Warna sesuai permintaan
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // ⬅️ ini yang membuat ke tengah
          children: [
            const SizedBox(), // Kosongkan atas
            Column(
              children: [
                Image.asset(
                  'assets/logo_twnzhub.png', // Pastikan ini file kamu
                  width: 560,
                  height: 160,
                ),
                const SizedBox(height: 16),
                const Text(
                  'TOWNZHUB',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1B0A46),
                  padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // ← Tambahkan ini untuk mengatur ukuran huruf
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
