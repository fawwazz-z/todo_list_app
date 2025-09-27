import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // background lembut
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo (bisa pakai Icon sementara)
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.brown[800],
            ),
            const SizedBox(height: 20),

            // Nama aplikasi
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

            // Loading indicator
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
