import 'package:flutter/material.dart';

class SplashscreenMobile extends StatelessWidget {
  const SplashscreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.brown[800]),
            const SizedBox(height: 20),
            Text(
              "CheckUP App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              color: Colors.brown,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
