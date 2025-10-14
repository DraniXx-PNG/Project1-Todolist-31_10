import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:project1_flutter/routes/routes.dart';

class ProfileWidePage extends StatelessWidget {
  const ProfileWidePage({super.key});

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(user["photo"] as String),
                ),
              ],
            ),
            const SizedBox(width: 60),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user["name"] as String,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user["about"] as String,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "About Me",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  _buildInfoRow("Name", user["name"] as String),
                  _buildInfoRow("Email", user["email"] as String),
                  _buildInfoRow("Phone", user["phone"] as String),
                  _buildInfoRow("Address", user["address"] as String),
                  _buildInfoRow("About", user["about"] as String),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color:
                    value.contains("@") ? Colors.blueAccent : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
