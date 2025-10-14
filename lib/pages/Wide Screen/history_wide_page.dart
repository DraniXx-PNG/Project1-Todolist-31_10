import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import 'package:project1_flutter/models/Todo_models.dart';

class HistoryWidePage extends StatelessWidget {
  HistoryWidePage({super.key});

  final TodolistController controller = Get.find<TodolistController>();

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
    return Scaffold(
      body: Obx(() {
        if (controller.historyTasks.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada history task",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            // Hitung jumlah kolom berdasarkan lebar layar
            int crossAxisCount = (constraints.maxWidth / 220).floor().clamp(1, 6);

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: controller.historyTasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85, // taller boxes to avoid overflow
                ),
                itemBuilder: (context, index) {
                  final task = controller.historyTasks[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey.shade600,
                              size: 32,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              task.title,
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task.category.name.capitalizeFirst ?? "",
                              style: TextStyle(
                                color: _getCategoryColor(task.category),
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.undo, color: Colors.blue, size: 20),
                              onPressed: () => controller.restoreTask(index),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () => controller.deleteHistoryTask(index),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
