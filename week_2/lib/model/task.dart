class Task {
  final String name;
  final String description;
  final DateTime dueDate;
  final bool isComplete;

  Task({
    required this.name,
    required this.description,
    required this.dueDate,
    required this.isComplete,
  });

  String get formattedDate {
    return "${dueDate.day}/${dueDate.month}/${dueDate.year}";
  }
}
