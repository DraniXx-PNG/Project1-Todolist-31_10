import 'package:get/get.dart';
import 'package:project1_flutter/controller/contact_controller.dart';


class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}