# Week 8

Pada minggu ini saya membuat API Todo list menggunakan FastAPI, saya memilih FastAPI karena FastAPI adalah salah satu framework web modern yang sangat cepat (berdasarkan Starlette dan Pydantic) untuk membuat API dengan Python 3.11+. FastAPI sangat cocok digunakan untuk membuat API yang membutuhkan performa tinggi. FastAPI juga memiliki dokumentasi yang sangat baik sehingga memudahkan pengguna dalam membuat API.

## API

Pada API ini saya membuat satu endpoint dengan beberapa method yaitu:

1. `/todos` (GET, POST, DELET)
   - Method GET digunakan untuk mendapatkan semua data todo list.
   - Method POST digunakan untuk menambahkan data todo list.
   - Method DELETE digunakan untuk menghapus data todo list.

Pada API ini saya menggunakan SQLite sebagai database untuk menyimpan data todo list. Untuk membuat data lebih konsisten saya membuat model TodoList yang memiliki atribut id, title, description.

````python
from pydantic import BaseModel

class Todo(BaseModel):
    title: str | None
    description: str | None
    completed: bool = False
````

## Implementasi

API ini diimplementasikan pada Flutter dengan menggunakan package `http` untuk melakukan request ke API. Pada aplikasi Flutter ini saya membuat halaman untuk menampilkan data todo list, menambahkan data todo list list.

Home.dart
```dart
import 'package:android/screen/addTodo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List todos = [];

  void fetchTodos() async {
    final Uri fetchEndpoint = Uri.parse('http://192.168.0.231:8000/todos/');
    final response = await http.get(fetchEndpoint);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      todos = parsed['result'];
    } else {
      throw Exception('Failed to load todos');
    }
  }

  void deleteTodo(int id) async {
    final Uri deleteEndpoint =
        Uri.parse('http://192.168.0.231:8000/todos/?todo_id=$id');
    final response = await http.delete(deleteEndpoint, headers: {
      'Content-Type': 'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {
      fetchTodos();
    } else {
      throw Exception('Failed to delete todo');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      fetchTodos();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          fetchTodos();
          setState(() {});
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todos[index]['id'].toString()),
              onDismissed: (direction) {
                deleteTodo(todos[index]['id']);
                setState(() {
                  todos.removeAt(index);
                });
              },
              child: ListTile(
                title: Text(todos[index]['title']),
                subtitle: Text(todos[index]['description']),
              ),
            );

          },
          itemCount: todos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Addtodo()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

addTodo.dart
```dart
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
```