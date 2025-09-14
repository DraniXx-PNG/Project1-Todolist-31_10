import 'package:get/get.dart';
import '../controller/todolist_edit_controller.dart';

class TodolistEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodolistEditController>(() => TodolistEditController());
  }
}
