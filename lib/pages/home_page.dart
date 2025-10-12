import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import 'package:project1_flutter/models/Todo_models.dart';
import 'package:project1_flutter/pages/todolistedit_page.dart';

class HomePage extends StatelessWidget {
HomePage({super.key});


  Color _getCategoryColor(TaskCategory category) {
    switch (category) {
      case TaskCategory.pribadi:
        return Colors.green;
      case TaskCategory.pekerjaan:
        return Colors.blue;
      case TaskCategory.sekolah:
        return Colors.orange;
      case TaskCategory.lainnya:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TodolistController controller = Get.put(TodolistController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todolist"),
      ),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return const Center(child: Text("Belum ada task"));
        }

        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final task = controller.tasks[index];
            final isDone = task.isDone;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (val) {
                    controller.toggleTask(index);
                  },
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    color: isDone ? Colors.grey : Colors.black,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  task.category.name.capitalizeFirst ?? "",
                  style: TextStyle(
                    color: isDone
                        ? Colors.grey
                        : _getCategoryColor(task.category as TaskCategory),
                  ),
                ),
                trailing: isDone
                    ? null
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              Get.toNamed(
                                '/todolist-edit',
                                arguments: index,
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              controller.deleteTask(index);
                            },
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TodolistEditPage(), arguments: -1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
