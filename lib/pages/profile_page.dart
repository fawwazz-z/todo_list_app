import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[800], // tema coklat tua
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil Dummy
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.brown[800],
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('images/ppkosong.jpg'),
              ),
            ),
            const SizedBox(height: 15),

            // Nama & Email Dummy
            const Text(
              "Fawwas X Rengga",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "murty@example.com",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // Card Informasi Dummy
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.work, color: Colors.brown),
                      title: Text("Sekolah"),
                      subtitle: Text("SMK RADEN UMAR SAID"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.brown),
                      title: Text("Lokasi"),
                      subtitle: Text("KUDUS"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.info, color: Colors.brown),
                      title: Text("Tentang Saya"),
                      subtitle: Text("Belajar Flutter dengan GetX "),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
