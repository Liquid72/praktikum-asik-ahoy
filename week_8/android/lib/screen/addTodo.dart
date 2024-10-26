import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddtodoState();
  }
}

class _AddtodoState extends State<Addtodo> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  void _sendOnServer() async {
    final Uri postEndpoint = Uri.parse('http://192.168.0.231:8000/todos/');
    final response = await http.post(postEndpoint,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "title": "$title",
          "description": "$description",
          "completed": false
        }));
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      print(response.body);
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _sendOnServer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  onSaved: (value) {
                    description = value!;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _submit();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
