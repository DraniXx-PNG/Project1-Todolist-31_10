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

            // 🔽 Dropdown Prioritas
            Obx(() => DropdownButtonFormField<TaskCategory>(
                  value: controller.selectedPriority.value,
                  decoration: const InputDecoration(
                    labelText: "kategori",
                    border: OutlineInputBorder(),
                  ),
                  items: TaskCategory.values.map((priority) {
                    return DropdownMenuItem<TaskCategory>(
                      value: priority,
                      child: Text(priority.name.capitalizeFirst ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) controller.selectedPriority.value = value;
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