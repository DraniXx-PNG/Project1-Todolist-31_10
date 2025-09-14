import 'package:get/get.dart';
import 'package:project1_flutter/models/Todo_models.dart';

class TodolistController extends GetxController {
  var tasks = <Task>[].obs;
  var historyTasks = <Task>[].obs;

  void addTask(String title, {TaskPriority priority = TaskPriority.normal}) {
    tasks.add(Task(title: title, priority: priority));
  }

  void updateTask(int index, Task newTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = newTask;
      tasks.refresh();
    }
  }

  void toggleTask(int index) {
    final task = tasks[index];
    task.isDone = !task.isDone;

    if (task.isDone) {
  
      historyTasks.add(task);
      tasks.removeAt(index);
    }

    tasks.refresh();
    historyTasks.refresh();
  }

  void restoreTask(int index) {
    final task = historyTasks[index];
    task.isDone = false;
    tasks.add(task);
    historyTasks.removeAt(index);

    tasks.refresh();
    historyTasks.refresh();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void deleteHistoryTask(int index) {
    historyTasks.removeAt(index);
  }
}
