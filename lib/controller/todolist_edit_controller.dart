import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import 'package:project1_flutter/models/Todo_models.dart';


class TodolistEditController extends GetxController {
  final todolistController = Get.find<TodolistController>();

  late TextEditingController titleController;
  late int taskIndex;
  var selectedPriority = TaskCategory.sekolah.obs;

  var isMobile = true.obs;


  void updateLayout(BoxConstraints constraints){
  isMobile.value = constraints.maxWidth < 600;
}


  @override
  void onInit() {
    super.onInit();

    taskIndex = (Get.arguments ?? -1) as int;

    if (taskIndex >= 0 && taskIndex < todolistController.tasks.length) {
      final Task task = todolistController.tasks[taskIndex];
      titleController = TextEditingController(text: task.title);
      selectedPriority.value = task.category;
    } else {
      titleController = TextEditingController();
    }
  }

  void saveTask() {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar("Peringatan", "Judul task tidak boleh kosong",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final newTask = Task(
      title: titleController.text,
      isDone: taskIndex >= 0
          ? todolistController.tasks[taskIndex].isDone
          : false,
      category: selectedPriority.value,
    );

    if (taskIndex >= 0) {
      todolistController.updateTask(taskIndex, newTask);
    } else {
      todolistController.addTask(newTask.title,
          priority: selectedPriority.value);
    }

    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }
}