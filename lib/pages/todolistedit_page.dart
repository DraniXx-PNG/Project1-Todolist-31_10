import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_edit_controller.dart';
import 'package:project1_flutter/models/Todo_models.dart';

class TodolistEditPage extends StatelessWidget {
TodolistEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodolistEditController controller = Get.put(TodolistEditController());

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.taskIndex >= 0 ? "Edit Task" : "Tambah Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: "Judul Task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // 🔥 Ubah Priority jadi Category
            Obx(() => DropdownButtonFormField<TaskCategory>(
                  value: controller.selectedCategory.value,
                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                  items: TaskCategory.values.map((category) {
                    return DropdownMenuItem<TaskCategory>(
                      value: category,
                      child: Text(category.name.capitalizeFirst ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) controller.selectedCategory.value = value;
                  },
                )),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: controller.saveTask,
              child: Text(controller.taskIndex >= 0 ? "Simpan" : "Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}
