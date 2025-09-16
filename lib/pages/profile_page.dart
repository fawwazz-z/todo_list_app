import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/widgets/custom_color.dart';
import 'login_page.dart'; // pastiin import ini sesuai path file login kamu

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget buildProfileCard({
    required String imagePath,
    required String name,
    required String email,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Foto profil
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.darkBrown,
              child: CircleAvatar(
                radius: 37,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(width: 16),

            // Nama & Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkBrown,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile pertama
            buildProfileCard(
              imagePath: 'images/ppkosong.jpg',
              name: 'Rengga Reznatra Danniswara',
              email: 'Renggard@example.com',
            ),

            // Profile kedua
            buildProfileCard(
              imagePath: 'images/ppkosong.jpg',
              name: 'Fawwas Labib',
              email: 'pawaslabib@example.com',
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
