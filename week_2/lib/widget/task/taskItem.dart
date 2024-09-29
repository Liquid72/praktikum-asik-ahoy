import 'package:flutter/material.dart';
import 'package:week_2/model/task.dart';

class Taskitem extends StatelessWidget {
  const Taskitem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Text(task.description),
                    const Spacer(),
                    Icon(task.isComplete ? Icons.check : Icons.close),
                    Text(task.formattedDate),
                  ],
                )
              ],
            )));
  }
}
