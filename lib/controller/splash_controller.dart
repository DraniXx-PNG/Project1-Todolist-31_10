import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:project1_flutter/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Checklogin();
  }

  Checklogin() async {
    await Future.delayed(Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final savedUSername = prefs.getString("username");
    if (savedUSername != null) {
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
