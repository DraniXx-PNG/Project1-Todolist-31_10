enum TaskPriority { low, normal, high, urgent }

class Task {
  String title;
  bool isDone;
  TaskPriority priority;

  Task({
    required this.title,
    this.isDone = false,
    this.priority = TaskPriority.normal, // biar gak null
  });
}


