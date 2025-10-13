import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:project1_flutter/models/Todo_models.dart';
import 'package:flutter/material.dart';
=======
import '../models/Todo_models.dart';
import '../helper/db_helper.dart';
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb

class TodolistController extends GetxController {
  var tasks = <Task>[].obs;
  var historyTasks = <Task>[].obs;
  final dbHelper = DBHelper();

<<<<<<< HEAD
  var isMobile = true.obs;


  void updateLayout(BoxConstraints constraints){
  isMobile.value = constraints.maxWidth < 600;
  }

=======
  @override
  void onInit() {
    super.onInit();
    loadTasks(); // <-- Muat data dari database saat app dibuka
>>>>>>> add41785e54426c9c91a03103392f5670ff6bfbb
 
  void addTask(String title, {TaskCategory category = TaskCategory.sekolah}) {
    tasks.add(Task(title: title, category: category));
  }

  // 🔹 Ambil semua data dari database
  Future<void> loadTasks() async {
    final data = await dbHelper.getTasks();
    tasks.value = data.map((e) => Task.fromMap(e)).toList();

    // Pisahkan yang sudah selesai (isDone = true) ke history
    historyTasks.value = tasks.where((task) => task.isDone).toList();
    tasks.value = tasks.where((task) => !task.isDone).toList();

    print("✅ Loaded ${tasks.length} active tasks & ${historyTasks.length} history tasks from DB");
  }

  // 🔹 Tambah task baru
  Future<void> addTask(String title, {TaskPriority priority = TaskPriority.normal}) async {
    final newTask = Task(title: title, priority: priority);
    await dbHelper.insertTask(newTask.toMap()); // simpan ke SQLite
    await loadTasks(); // refresh list
  }

  // 🔹 Update task
  Future<void> updateTask(int index, Task updatedTask) async {
    final task = tasks[index];
    updatedTask.id = task.id;
    await dbHelper.updateTask(task.id!, updatedTask.toMap());
    await loadTasks();
  }

  // 🔹 Tandai task selesai / belum
  Future<void> toggleTask(int index) async {
    final task = tasks[index];
    task.isDone = !task.isDone;
    await dbHelper.updateTask(task.id!, task.toMap());
    await loadTasks();
  }
  // 🔹 Hapus task
  Future<void> deleteTask(int index) async {
    final id = tasks[index].id;
    if (id != null) {
      await dbHelper.deleteTask(id);
    if (task.isDone) {
      historyTasks.add(task);
      tasks.removeAt(index);
    }
    await loadTasks();
  }

  
  Future<void> deleteHistoryTask(int index) async {
    final id = historyTasks[index].id;
    if (id != null) {
      await dbHelper.deleteTask(id);
    }
    await loadTasks();
  }

  Future<void> restoreTask(int index) async {
    final task = historyTasks[index];
    task.isDone = false;
    await dbHelper.updateTask(task.id!, task.toMap());
    await loadTasks();
  }
}
