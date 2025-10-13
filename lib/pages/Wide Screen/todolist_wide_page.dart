import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_flutter/controller/todolist_controller.dart';
import 'package:project1_flutter/models/Todo_models.dart';
import 'package:project1_flutter/pages/todolistedit_page.dart';

class TodolistWidePage extends StatelessWidget {
  TodolistWidePage({super.key});
  final TodolistController controller = Get.put(TodolistController());

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

  IconData _getCategoryIcon(TaskCategory category) {
    switch (category) {
      case TaskCategory.pribadi:
        return Icons.person;
      case TaskCategory.pekerjaan:
        return Icons.work;
      case TaskCategory.sekolah:
        return Icons.school;
      case TaskCategory.lainnya:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Obx(() {
          if (controller.tasks.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada task",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return GridView.builder(
            itemCount: controller.tasks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 kolom
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final task = controller.tasks[index];
              final color = _getCategoryColor(task.category as TaskCategory);

              return GestureDetector(
  onTap: () {
    Get.to(() => TodolistEditPage(), arguments: index);
  },
  child: Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 6,
          offset: const Offset(2, 4),
        ),
      ],
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(
              _getCategoryIcon(task.category as TaskCategory),
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              task.category.name.capitalizeFirst ?? "",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
        task.isDone
            ? const Text(
                "✅ Selesai",
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              )
            : ElevatedButton.icon(
                onPressed: () {
                  controller.toggleTask(index);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: color,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(fontSize: 12),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(Icons.check_circle_outline, size: 16),
                label: const Text("Tandai Selesai"),
              ),
                        ],
                    ),
                 ),
               );

            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TodolistEditPage(), arguments: -1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
