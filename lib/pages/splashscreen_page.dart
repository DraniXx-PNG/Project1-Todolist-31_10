import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 100 ), () {
      authController.autoLogin();
    });

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
