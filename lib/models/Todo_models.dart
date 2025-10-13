enum TaskPriority { low, normal, high, urgent }

class Task {
  int? id;
  String title;
  bool isDone;
  TaskPriority priority;

  Task({
    this.id,
    required this.title,
    this.isDone = false,
    this.priority = TaskPriority.normal,
  });

  
  String get priorityString {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.high:
        return 'High';
      case TaskPriority.urgent:
        return 'Urgent';
      default:
        return 'Normal';
    }
  }

  static TaskPriority priorityFromString(String value) {
    switch (value) {
      case 'Low':
        return TaskPriority.low;
      case 'High':
        return TaskPriority.high;
      case 'Urgent':
        return TaskPriority.urgent;
      default:
        return TaskPriority.normal;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0, 
      'priority': priorityString, 
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
      priority: priorityFromString(map['priority']),
    );
  }
}
