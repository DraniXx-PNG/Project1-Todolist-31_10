import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/splash_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final SplashController controller = Get.find<SplashController>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("Ini SplashScreen"))),
    );
  }
}
