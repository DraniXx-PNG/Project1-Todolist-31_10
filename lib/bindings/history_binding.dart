import 'package:get/get.dart';
import '../controller/todolist_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodolistController()); 
  }
}
