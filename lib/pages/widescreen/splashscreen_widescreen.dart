import 'package:flutter/material.dart';

class SplashscreenWidescreen extends StatelessWidget {
  const SplashscreenWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo besar di kiri
            Icon(
              Icons.check_circle,
              size: 180,
              color: Colors.brown[800],
            ),
            const SizedBox(width: 40),

            // Teks di kanan
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CheckUP App",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  color: Colors.brown,
                  strokeWidth: 4,
                ),
                const SizedBox(height: 20),
                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.brown[600],
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
