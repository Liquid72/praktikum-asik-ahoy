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

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  void fetchTodos() async {
    /// Fungsi `fetchTodos` digunakan untuk mengambil daftar tugas (todos) dari endpoint yang telah ditentukan.
    ///
    /// Fungsi ini menggunakan metode HTTP GET untuk mengambil data dari endpoint `http://192.168.0.231:8000/todos/`.
    /// Jika permintaan berhasil (status kode 200), data yang diterima akan di-decode dari format JSON dan disimpan
    /// ke dalam variabel `todos`. Jika permintaan gagal, fungsi ini akan melempar sebuah exception.
    ///
    /// Fungsi ini bersifat asynchronous dan harus dipanggil dengan menggunakan `await`.
    ///
    /// Contoh penggunaan:
    /// ```dart
    /// await fetchTodos();
    /// ```

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
    /// Menghapus todo berdasarkan ID yang diberikan.
    ///
    /// Fungsi ini mengirimkan permintaan HTTP DELETE ke endpoint yang ditentukan
    /// dengan ID todo yang diberikan. Jika permintaan berhasil (status code 200),
    /// fungsi `fetchTodos` akan dipanggil untuk memperbarui daftar todo. Jika
    /// permintaan gagal, sebuah pengecualian akan dilempar.
    ///
    /// Parameter:
    /// - `id`: ID dari todo yang akan dihapus.
    ///
    /// Pengecualian:
    /// - `Exception`: Dilempar jika permintaan HTTP DELETE gagal.
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            fetchTodos();
          });
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todos[index]['id'].toString()),
              onDismissed: (direction) {
                deleteTodo(todos[index]['id']);
                setState(() {
                  todos.removeAt(index);
                  fetchTodos();
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  title: Text(todos[index]['title']),
                  subtitle: Text(todos[index]['description']),
                ),
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
