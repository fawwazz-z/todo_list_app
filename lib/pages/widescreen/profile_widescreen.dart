import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/controllers/profile_controller.dart';
import 'package:todo_list_app/widgets/custom_color.dart';

class ProfileWidescreen extends StatelessWidget {
  ProfileWidescreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  Widget buildProfileCard({
    required String imagePath,
    required String name,
    required String email,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.brown[800],
              child: CircleAvatar(
                radius: 47,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
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
        backgroundColor: Colors.brown[800],
        title: const Text("Profile (Widescreen)", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header teks
                const Text(
                  "Team Member Profile",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // Layout 2 kolom (kiri - kanan)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: buildProfileCard(
                        imagePath: 'images/rengga.jpg',
                        name: 'Rengga Reznatra Daniswara',
                        email: 'reenggard@example.com',
                      ),
                    ),
                    Expanded(
                      child: buildProfileCard(
                        imagePath: 'images/pawas.jpg',
                        name: 'Pawas Labib',
                        email: 'pawaslabibs@example.com',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Tombol logout di bawah
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[800],
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    controller.logout();
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
