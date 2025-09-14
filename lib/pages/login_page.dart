import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';

import 'package:project1_flutter/widgets/custom_button.dart';
import 'package:project1_flutter/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 12,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("lib/aset/images/ambakus.jpg"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Login to continue",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 25),

                    // Username Field
                    MyTextField(
                      textEditingController: authController.usernameController,
                      labelText: "Username",
                      IsPassword: false,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    MyTextField(
                      textEditingController: authController.passwordController,
                      labelText: "Password",
                      IsPassword: true,
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    CustomButton(
                      text: "Login",
                      textColor: Colors.black,
                      onPressed: () {
                        authController.login();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
