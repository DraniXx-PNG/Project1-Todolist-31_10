import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
