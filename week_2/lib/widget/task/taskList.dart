import 'package:flutter/material.dart';
import 'package:week_2/model/task.dart';
import 'package:week_2/widget/task/taskItem.dart';

class Tasklist extends StatelessWidget {
  const Tasklist({super.key, required this.taskList, required this.removeTask});

  final List<Task> taskList;
  final Function(Task task) removeTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      shrinkWrap: true,
      itemCount: taskList.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(horizontal: 16)),
          onDismissed: (direction) => {
                removeTask(taskList[index]),
              },
          key: ValueKey(taskList[index]),
          child: Taskitem(task: taskList[index])),
    );
  }
}
