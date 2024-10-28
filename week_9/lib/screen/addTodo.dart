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
    /// Mengirim data todo ke server menggunakan metode HTTP POST.
    ///
    /// Fungsi ini mengirimkan data todo yang berisi judul, deskripsi, dan status
    /// penyelesaian ke endpoint server yang telah ditentukan. Jika permintaan berhasil
    /// (status kode 200), layar saat ini akan ditutup. Jika tidak, respons dari server
    /// akan dicetak ke konsol.
    ///
    /// Endpoint: `http://192.168.0.231:8000/todos/`
    ///
    /// Header:
    /// - Content-Type: application/json
    ///
    /// Body:
    /// - title: Judul dari todo
    /// - description: Deskripsi dari todo
    /// - completed: Status penyelesaian (selalu false)
    ///
    /// Catatan: Fungsi ini bersifat asinkron.

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
    /// Fungsi `_submit` digunakan untuk memvalidasi dan menyimpan data dari form.
    /// Jika validasi berhasil, data akan disimpan dan dikirim ke server dengan
    /// memanggil fungsi `_sendOnServer`.
    ///
    /// Fungsi ini pertama-tama memeriksa apakah form valid dengan memanggil
    /// `validate()` pada `_formKey.currentState`. Jika validasi berhasil, maka
    /// `save()` akan dipanggil untuk menyimpan data form, dan kemudian
    /// `_sendOnServer()` akan dipanggil untuk mengirim data tersebut ke server.

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _sendOnServer();
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Membangun widget untuk layar penambahan Todo.
    ///
    /// Widget ini menggunakan `Scaffold` dengan `AppBar` yang memiliki judul 'Add Todo'.
    /// Di dalam `body`, terdapat `SingleChildScrollView` yang membungkus `Form`.
    ///
    /// Form ini memiliki dua `TextFormField` untuk memasukkan judul dan deskripsi Todo.
    /// Setiap `TextFormField` memiliki `InputDecoration` untuk menampilkan label.
    ///
    /// Terdapat juga sebuah `ElevatedButton` yang ketika ditekan akan memanggil
    /// fungsi `_submit` untuk menyimpan data yang dimasukkan.
    ///
    /// Properti:
    /// - `context`: BuildContext yang digunakan untuk membangun widget.
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
