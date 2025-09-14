import 'package:get/get.dart';
import '../controller/todolist_controller.dart';

class TodolistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodolistController());
  }
}
