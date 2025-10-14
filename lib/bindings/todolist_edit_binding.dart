import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import '../controller/todolist_edit_controller.dart';

class TodolistEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodolistController>(() => TodolistController());
  }
}


