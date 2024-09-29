import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_2/model/task.dart';

final formatter = DateFormat.yMd();

class Taskform extends StatefulWidget {
  const Taskform({super.key, required this.addTask});

  final Function(Task task) addTask;

  @override
  State<Taskform> createState() {
    return _TaskformState();
  }
}

class _TaskformState extends State<Taskform> {
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  DateTime? _selectedDate;
  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: now,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    final enteredTaskName = _taskNameController.text;
    final enteredTaskDescription = _taskDescriptionController.text;

    if (enteredTaskName.isEmpty ||
        _selectedDate == null ||
        enteredTaskDescription.trim().isEmpty ||
        enteredTaskDescription.length > 128) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter a valid task name and description'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }
    widget.addTask(
      Task(
          name: _taskNameController.text,
          description: _taskDescriptionController.text,
          dueDate: _selectedDate!,
          isComplete: false),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _taskNameController,
            decoration: const InputDecoration(labelText: 'Task Name'),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: _taskDescriptionController,
            decoration: const InputDecoration(labelText: 'Task Description'),
            keyboardType: TextInputType.text,
            maxLength: 128,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(_selectedDate == null
                  ? 'No Date Chosen'
                  : 'Picked Date: ${formatter.format(_selectedDate!)}'),
              IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_today))
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  // print(_taskNameController.text);
                  _submitData();
                },
                child: const Text('Save'),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
