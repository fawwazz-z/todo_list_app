import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/profile_controller.dart';
import 'package:todo_list_app/widgets/custom_color.dart';

class ProfileMobile extends StatelessWidget {
  ProfileMobile({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: const Text("Profile (Mobile)",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/pawas.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pawas Labib',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('pawaslabibs@example.com'),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[800],
              ),
              onPressed: () => controller.logout(),
              child: const Text("Logout",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
