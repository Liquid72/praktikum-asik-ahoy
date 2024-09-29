# Week 2 - Widgets 

## Daftar Isi
- [Pendahuluan](#pendahuluan)
- [Perkenalan Widget](#perkenalan-widget)
    - [StatelessWidget](#statelesswidget)
    - [StatefulWidget](#statefulwidget)


## Pendahuluan
Widget adalah komponen yang dapat digunakan untuk membangun aplikasi Flutter. Widget mendefinisikan tata letak dan perilaku aplikasi. Flutter memiliki banyak widget yang dapat digunakan untuk membangun aplikasi. Widget dapat diperbarui dan diubah sesuai kebutuhan aplikasi.

## Perkenalan Widget
Flutter memiliki dua jenis widget yaitu StatelessWidget dan StatefulWidget. StatelessWidget adalah widget yang tidak berubah sepanjang aplikasi berjalan. StatefulWidget adalah widget yang dapat berubah sepanjang aplikasi berjalan.

### StatelessWidget
StatelessWidget adalah widget yang tidak berubah sepanjang aplikasi berjalan. StatelessWidget digunakan untuk membuat widget yang tidak berubah sepanjang aplikasi berjalan. StatelessWidget digunakan untuk membuat widget yang tidak berubah sepanjang aplikasi berjalan.
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```


### StatefulWidget
StatefulWidget adalah widget yang dapat berubah sepanjang aplikasi berjalan. StatefulWidget digunakan untuk membuat widget yang dapat berubah sepanjang aplikasi berjalan. StatefulWidget digunakan untuk membuat widget yang dapat berubah sepanjang aplikasi berjalan.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = 'Hello World';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(
          child: Text(text),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              text = 'Hello Flutter';
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

## Implementasi Widget
Dalam praktikum minggu ini saya telah mengimplementasikan widgets StatelessWidget dan StatefulWidget untuk membuat sebuak aplikasi task tracker sederhana. [Klik disini](/lib/) untuk melihat implementasi widget.



## Daftar Pustaka
- [Flutter Documentation](https://flutter.dev/docs)
