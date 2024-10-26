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
            // return Dismissible(
            //   key: Key(todos[index]['id'].toString()),
            //   onDismissed: (direction) {
            //     deleteTodo(todos[index]['id']);
            //   },
            //                   background: Container(
            //     color: Colors.red,
            //     alignment: Alignment.centerRight,
            //     child: const Icon(Icons.delete),
            //   ),

            //   child: ListTile(
            //     title: Text(todos[index]['title']),
            //     subtitle: Text(todos[index]['description']),
            //   ),
            // );
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
