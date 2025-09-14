import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

   
    final int userIndex = Get.arguments ?? -1;

    if (userIndex < 0 || userIndex >= authController.users.length) {
    
      Future.microtask(() => Get.offAllNamed(AppRoutes.login));
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final Map<String, dynamic> user = authController.users[userIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Foto Profil
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(user["photo"] as String),
            ),
            const SizedBox(height: 10),

            // Nama
            Text(
              user["name"] as String,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // Email
            Text(
              user["email"] as String,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Phone
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent),
                title: const Text("Nomor Telepon"),
                subtitle: Text(user["phone"] as String),
              ),
            ),

            // Address
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blueAccent),
                title: const Text("Alamat"),
                subtitle: Text(user["address"] as String),
              ),
            ),

            // About
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.blueAccent),
                title: const Text("Tentang Saya"),
                subtitle: Text(user["about"] as String),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
