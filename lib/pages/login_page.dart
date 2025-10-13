import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:project1_flutter/pages/Mobile%20Screen/login_mobile_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/login_wide_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController controlller = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: LayoutBuilder(
        builder: (context, constraints) {
          controlller.updateLayout(constraints); //Detection width screen
          //transforming load page
          return Obx(() => controlller.isMobile.value
             ? LoginPageMobile() 
             : LoginPageWide());
        }),
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

                    
                    MyTextField(
                      textEditingController: authController.usernameController,
                      labelText: "Username",
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),

                   
                    MyTextField(
                      textEditingController: authController.passwordController,
                      labelText: "Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),

                    
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
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb
    );
  }
}