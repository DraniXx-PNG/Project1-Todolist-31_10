import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';


class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodolistController controller = Get.find<TodolistController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("History Task"),
      ),
      body: Obx(() {
        if (controller.historyTasks.isEmpty) {
          return const Center(child: Text("Belum ada history task"));
        }

        return ListView.builder(
          itemCount: controller.historyTasks.length,
          itemBuilder: (context, index) {
            final task = controller.historyTasks[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.grey),
                title: Text(
                  task.title,
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                subtitle: Text(
                  task.category.name[0].toUpperCase() +
                      task.category.name.substring(1),
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.undo, color: Colors.blue),
                      onPressed: () {
                        controller.restoreTask(index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        controller.deleteHistoryTask(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
