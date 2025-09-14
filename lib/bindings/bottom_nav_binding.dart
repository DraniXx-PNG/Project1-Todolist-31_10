import 'package:get/get.dart';
import 'package:project1_flutter/controller/bottom_nav_controller.dart';


class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
