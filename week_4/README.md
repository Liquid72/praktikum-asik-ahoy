# Week 4
## ListView.builder
 

Deskripsi
 
ListView.builder digunakan untuk membuat daftar yang hanya membangun widget yang diperlukan yang sedang on-screen. Ini sangat berguna untuk daftar yang memiliki jumlah item yang banyak atau tidak terbatas.

Implementasi
 
Kode berikut mendefinisikan halaman dengan ListView.builder yang memungkinkan pengguna menyesuaikan jumlah item melalui Slider.

```dart
import 'package:flutter/material.dart';  
  
class Listviewbuilderscreen extends StatefulWidget {  
  const Listviewbuilderscreen({Key? key}) : super(key: key);  
  
  @override  
  _ListViewBuilderScreenState createState() => _ListViewBuilderScreenState();  
}  
  
class _ListViewBuilderScreenState extends State<Listviewbuilderscreen> {  
  int itemCount = 10;  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
        appBar: AppBar(  
          title: const Text('ListView.builder'),  
        ),  
        body: Column(  
          children: <Widget>[  
            Slider(  
              value: itemCount.toDouble(),  
              min: 0,  
              max: 100,  
              onChanged: (newValue) {  
                setState(() {  
                  itemCount = newValue.round();  
                });  
              },  
            ),  
            Text('Number of items: $itemCount'),  
            Expanded(  
              child: ListView.builder(  
                itemCount: itemCount,  
                itemBuilder: (BuildContext context, int index) {  
                  return ListTile(  
                    title: Text('Item $index'),  
                  );  
                },  
              ),  
            ),  
          ],  
        ));  
  }  
}  
 ```

### Observasi
 

Aplikasi berhasil menampilkan ListView.builder dengan jumlah item yang dapat diatur melalui Slider.
Ketika Slider digeser, jumlah item di ListView berubah sesuai nilai yang dipilih pengguna.
Performa tetap lancar walaupun jumlah item diatur ke nilai yang tinggi karena hanya item yang visible yang dibangun.
## ListView.custom
 

### Deskripsi
 
ListView.custom memungkinkan pembuatan daftar dengan lebih banyak kontrol terhadap proses pembuatan item, menggunakan SliverChildBuilderDelegate atau SliverChildListDelegate.

### Implementasi
 
Halaman berikut menggunakan ListView.custom dengan SliverChildBuilderDelegate untuk menghasilkan item daftar.

```dart
import 'package:flutter/material.dart';  
  
class Listviewcustomscreen extends StatefulWidget {  
  const Listviewcustomscreen({Key? key}) : super(key: key);  
  
  @override  
  _ListViewCustomScreenState createState() => _ListViewCustomScreenState();  
}  
  
class _ListViewCustomScreenState extends State<Listviewcustomscreen> {  
  int itemCount = 10;  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('ListView.custom'),  
      ),  
      body: Column(  
        children: <Widget>[  
          Slider(  
            value: itemCount.toDouble(),  
            min: 0,  
            max: 100,  
            onChanged: (newValue) {  
              setState(() {  
                itemCount = newValue.round();  
              });  
            },  
          ),  
          Text('Number of items: $itemCount'),  
          Expanded(  
            child: ListView.custom(  
              childrenDelegate: SliverChildBuilderDelegate(  
                (BuildContext context, int index) {  
                  return ListTile(  
                    title: Text('Item $index'),  
                  );  
                },  
                childCount: itemCount,  
              ),  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
```
 

### Hasil Observasi
 

ListView.custom berhasil ditampilkan dengan kemampuan menyesuaikan jumlah item melalui Slider.
Memberikan kontrol lebih terhadap proses pembuatan item daftar.
## ListView.separated
 

### Deskripsi
 
ListView.separated digunakan untuk membuat daftar dengan pemisah antar item. Pemisah bisa berupa widget apa saja, seperti Divider.

### Implementasi
 
Contoh kode berikut menunjukkan penggunaan ListView.separated dengan pembatas Divider.

```dart
import 'package:flutter/material.dart';  
  
class Listviewseparatescreen extends StatefulWidget {  
  const Listviewseparatescreen({Key? key}) : super(key: key);  
  
  @override  
  _ListViewSeparateScreenState createState() => _ListViewSeparateScreenState();  
}  
  
class _ListViewSeparateScreenState extends State<Listviewseparatescreen> {  
  int itemCount = 10;  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('ListView.separated'),  
      ),  
      body: Column(  
        children: <Widget>[  
          Slider(  
            value: itemCount.toDouble(),  
            min: 0,  
            max: 100,  
            onChanged: (newValue) {  
              setState(() {  
                itemCount = newValue.round();  
              });  
            },  
          ),  
          Text('Number of items: $itemCount'),  
          Expanded(  
            child: ListView.separated(  
              itemCount: itemCount,  
              separatorBuilder: (BuildContext context, int index) {  
                return const Divider();  
              },  
              itemBuilder: (BuildContext context, int index) {  
                return ListTile(  
                  title: Text('Item $index'),  
                );  
              },  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
 ```

### Hasil Observasi
 

ListView.separated menampilkan daftar item dengan pembatas antara setiap item.
Mudah digunakan ketika ingin menambahkan pemisah khusus seperti garis atau spasi yang konsisten antar item.