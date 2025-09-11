import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/routes/routes.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final user = usernameController.text.trim();
    final pass = passwordController.text.trim();

    if (user == "ghasia" && pass == "admin123") {
      _successLogin(user, AppRoutes.bottomNav);
    } else if (user == "dhiaz" && pass == "123456") {
      _successLogin(user, AppRoutes.bottomNav);
    } else {
      Get.snackbar(
        'Login Gagal!',
        'Username atau password salah.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  void _successLogin(String user, String route) {
    Get.snackbar(
      'Login Berhasil!',
      'Selamat datang kembali $user!',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );

    // 👉 langsung masuk ke halaman bottom nav
    Get.offAllNamed(
      route,
      arguments: {"username": user},
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
