import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final users = [
    {
      "username": "ghasia",
      "password": "admin123",
      "name": "Rajendra Ghasia Demarco",
      "email": "rajendraghasia28@gmail.com",
      "phone": "+62 889 1768 165",
      "address": "Kudus",
      "about": "Saya seorang Software Engineer.",
      "photo": "lib/aset/images/isagi.jpg",
    },
    {
      "username": "dhiaz",
      "password": "123456",
      "name": "Dhiaz Alviansyah",
      "email": "dhiazalfinsyah@gmail.com",
      "phone": "+62 813-2739-9842",
      "address": "Klaten",
      "about": "Saya seorang Software Engineer.",
      "photo": "lib/aset/images/kaiser.jpg",
    },
  ];

  var currentUserIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");

    if (username != null) {
      final index = users.indexWhere((u) => u["username"] == username);
      if (index != -1) {
        currentUserIndex.value = index;
        Get.offAllNamed(AppRoutes.bottomNav, arguments: index);
      }
    }
  }

  Future<void> login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Login Gagal!",
        "Data belum diisi.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      return;
    }

    final index = users.indexWhere(
      (u) => u["username"] == username && u["password"] == password,
    );

    if (index != -1) {
      currentUserIndex.value = index;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);

      Get.snackbar(
        "Login Berhasil!",
        "Selamat datang ${users[index]["name"]}!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );

      Get.offAllNamed(AppRoutes.bottomNav, arguments: index);
    } else {
      Get.snackbar(
        "Login Gagal!",
        "Username atau password salah.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    }
  }


  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");

    Get.defaultDialog(
      title: "Konfirmasi Logout",
      middleText: "Apakah kamu yakin ingin logout?",
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () {
          currentUserIndex.value = -1;
          clearControllers();
          Get.back();

          Get.snackbar(
            "Logout Berhasil!",
            "Silakan login kembali.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
          );

          Get.offAllNamed('/login');
        },
        child: const Text("Iya", style: TextStyle(color: Colors.white)),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        onPressed: () => Get.back(),
        child: const Text("Tidak", style: TextStyle(color: Colors.white)),
      ),
    );
  }

void logout() {
  Get.defaultDialog(
  title: "Konfirmasi Logout",
  middleText: "Apakah kamu yakin ingin logout?",
  confirm: ElevatedButton(
  style: ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
      ),
    onPressed: () {
      currentUserIndex.value = -1;
      clearControllers();

      Get.snackbar(
        "Logout Berhasil!",
        "Silakan login kembali.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );


      Get.offAllNamed('/login');
      },
    child: const Text("Iya", style: TextStyle(color: Colors.white)),
    ),
    cancel: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      ),
      onPressed: () {
        Get.back();
      },
      child: const Text("Tidak", style: TextStyle(color: Colors.white)),
    ),
  );
}
  void clearControllers() {
    usernameController.clear();
    passwordController.clear();
  }
}
