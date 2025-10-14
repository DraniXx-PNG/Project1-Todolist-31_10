import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/auth_controller.dart';
import 'package:project1_flutter/pages/Mobile%20Screen/profile_mobile_page.dart';
import 'package:project1_flutter/pages/Wide%20Screen/profile_wide_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);

          return Obx(() {
            // kalau belum login, arahkan ke halaman login
            if (controller.currentUserIndex.value == -1) {
              Future.microtask(() => Get.offAllNamed('/login'));
              return const Center(child: CircularProgressIndicator());
            }

            // kalau sudah login
            return controller.isMobile.value
                ? ProfileMobilePage()
                : ProfileWidePage();
          });
        },
      ),
    );
  }
}
