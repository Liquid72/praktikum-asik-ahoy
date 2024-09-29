import 'package:flutter/material.dart';
import 'package:week_2/model/task.dart';
import 'package:week_2/widget/task/taskForm.dart';
import 'package:week_2/widget/task/taskList.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});
  @override
  State<Tasks> createState() {
    return _TaskState();
  }
}

class _TaskState extends State<Tasks> {
  final List<Task> _taskList = [
    Task(
        name: 'Tugas Web1',
        description: 'Mengerjakan tugas web',
        dueDate: DateTime.now(),
        isComplete: false),
  ];

  void _addTask(Task task) {
    setState(() {
      _taskList.add(task);
    });
  }

  void _removeTask(Task task) {
    final taskIndex = _taskList.indexOf(task);
    setState(() {
      _taskList.remove(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Task Removed'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _taskList.insert(taskIndex, task);
            });
          }),
    ));
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Taskform(addTask: _addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No Task Found'));

    if (_taskList.isNotEmpty) {
      mainContent = Tasklist(taskList: _taskList, removeTask: _removeTask);
    } else {
      mainContent = const Center(child: Text('No Task Found'));
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text('Task Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openAddTaskOverlay();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // const Text('Task List'),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
