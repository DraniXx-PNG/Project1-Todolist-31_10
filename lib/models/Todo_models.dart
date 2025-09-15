enum TaskCategory {pribadi ,pekerjaan, sekolah,  lainnya,}

class Task {
  String title;
  bool isDone;
  TaskCategory category;

  Task({
    required this.title,
    this.isDone = false,
    this.category = TaskCategory.lainnya,
  });
}
