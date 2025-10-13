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
      body: LayoutBuilder(
        builder: (context, constraints) {
          controlller.updateLayout(constraints); //Detection width screen
          //transforming load page
          return Obx(() => controlller.isMobile.value
             ? LoginPageMobile() 
             : LoginPageWide());
        }),
    );
  }
}