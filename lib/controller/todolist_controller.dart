import 'package:get/get.dart';
import 'package:project1_flutter/models/Todo_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodolistController extends GetxController {
  var tasks = <Task>[].obs;
  var historyTasks = <Task>[].obs;
  var isMobile = true.obs;


  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  
  @override
  void onInit() {
    super.onInit();
    loadTasks(); 
  }

 
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();


    List<String> taskList = tasks.map((t) => '${t.title}|${t.category.index}|${t.isDone}').toList();
    List<String> historyList = historyTasks.map((t) => '${t.title}|${t.category.index}|${t.isDone}').toList();

    await prefs.setStringList('tasks', taskList);
    await prefs.setStringList('historyTasks', historyList);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    final taskList = prefs.getStringList('tasks') ?? [];
    final historyList = prefs.getStringList('historyTasks') ?? [];

    
    tasks.assignAll(taskList.map((item) {
      final parts = item.split('|');
      return Task(
        title: parts[0],
        category: TaskCategory.values[int.parse(parts[1])],
        isDone: parts[2] == 'true',
      );
    }).toList());

    historyTasks.assignAll(historyList.map((item) {
      final parts = item.split('|');
      return Task(
        title: parts[0],
        category: TaskCategory.values[int.parse(parts[1])],
        isDone: parts[2] == 'true',
      );
    }).toList());
  }


  void addTask(String title, {TaskCategory priority = TaskCategory.sekolah}) {
    tasks.add(Task(title: title, category: priority));
    saveTasks(); 
  }

  void updateTask(int index, Task newTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = newTask;
      tasks.refresh();
      saveTasks();
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
    saveTasks();
  }

  void restoreTask(int index) {
    final task = historyTasks[index];
    task.isDone = false;
    tasks.add(task);
    historyTasks.removeAt(index);

    tasks.refresh();
    historyTasks.refresh();
    saveTasks();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    saveTasks();
  }

  void deleteHistoryTask(int index) {
    historyTasks.removeAt(index);
    saveTasks();
  }

 
  Future<void> clearAllData() async {
    tasks.clear();
    historyTasks.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('tasks');
    await prefs.remove('historyTasks');
  }
}
