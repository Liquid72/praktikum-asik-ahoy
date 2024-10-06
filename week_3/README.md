# Week 3

## Daftar Isi
1. [Stack](#stack)
2. [Padding](#padding)
3. [Align](#align)
4. [Elevated Button](#elevated-button)
5. [Text Field](#text-field)
6. [Image](#image)
7. [Penerapan Container](#penerapan-container)
8. [Icon](#icon)
9. [Error Yang Sering Terjadi](#error-yang-sering-terjadi)
9. [Daftar Pustaka](#daftar-pustaka)

## Stack
Widget ini memungkinkan menumpuk beberapa widget di atas satu sama lain. Child pertama yang ditambahkan akan berada di bagian bawah, sedangkan child terakhir yang ditambahkan akan berada di bagian atas. Widget ini sangat berguna untuk menata widget secara bebas, tanpa harus memikirkan tata letaknya.

Dengan demikian, widget ini memungkinkan kita untuk membuat tata letak yang lebih kompleks, seperti menumpuk teks di atas gambar, menumpuk tombol di atas gambar, dan lain-lain. Widget ini juga memungkinkan kita untuk mengatur posisi anak-anaknya dengan menggunakan properti alignment.

Stack memiliki properti sebagai berikut:
* alignment: Mengatur bagaimana anak-anak yang tidak diposisikan dan sebagian diposisikan disejajarkan dalam Stack.
* children: Daftar widget yang ada di bawah widget ini dalam hierarki.
* clipBehavior: Menentukan apakah konten akan dipotong atau tidak sesuai dengan opsi yang dipilih.
* fit: Menentukan bagaimana ukuran anak-anak yang tidak diposisikan dalam Stack.
hashCode: Kode unik untuk objek ini, tidak bisa diubah.
* key: Mengontrol bagaimana satu widget menggantikan widget lain di dalam hierarki, tidak bisa diubah.
* runtimeType: Menunjukkan tipe objek ini saat berjalan, tidak bisa diubah.
textDirection: Menentukan arah teks yang digunakan untuk mengatur penyelarasan.

Berikut contoh penggunaan Stack:
```dart
import 'package:flutter/material.dart';

class Stackscreen extends StatelessWidget {
  const Stackscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Screen'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

```


## Padding
Dalam Flutter, Padding adalah widget yang digunakan untuk menambahkan ruang kosong di sekitar widget lain. Ini membantu dalam pengaturan tata letak dengan memberikan spasi antara widget dan batasnya. Kita dapat menentukan ukuran padding menggunakan EdgeInsets, yang memungkinkan Kita untuk mengatur padding secara seragam atau spesifik untuk setiap sisi (atas, bawah, kiri, kanan). 

Padding memiliki properti sebagai berikut:
* child: Widget yang akan diberi padding.
* padding: Jarak yang akan ditambahkan di sekeliling widget anak.
* hashCode: Kode unik untuk objek ini, tidak bisa diubah.
* key: Mengontrol bagaimana satu widget menggantikan widget lain di dalam hierarki, tidak bisa diubah
* runtimeType: Menunjukkan tipe objek ini saat berjalan, tidak bisa diubah.


Contoh penggunaan Padding:
```dart
import 'package:flutter/material.dart';

class Paddingscreen extends StatelessWidget {
  const Paddingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Align
Widget Align di Flutter digunakan untuk mengatur posisi widget anak di dalam dirinya sendiri. Kita dapat menentukan posisi menggunakan properti alignment, seperti Alignment.center, Alignment.topLeft, dan lain-lain. Dengan widget Align memungkinkan penempatan widget secara fleksibel dalam tata letak, memudahkan pengaturan posisi relatif terhadap batas-batas Align.



Align memiliki properti sebagai berikut: 
* alignment: Menentukan posisi anak di dalam widget ini.
* child: Widget yang akan diatur posisinya.
* heightFactor: Menentukan faktor ukuran tinggi widget ini
* widthFactor: Menentukan faktor ukuran lebar widget ini
* hashCode: Kode unik untuk objek ini, tidak bisa diubah.
* key: Mengontrol bagaimana satu widget menggantikan widget lain di dalam hierarki, tidak bisa diubah

Berikut contoh penggunaan Align:
```dart
import 'package:flutter/material.dart';

class Alignscreen extends StatelessWidget {
  const Alignscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align Screen'),
      ),
      body: Center(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 100,
              color: Colors.red,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 100,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      )),
    );
  }
}
```

## Elevated Button
Widget ini merupakan tombol yang memiliki efek naik ketika ditekan. 

ElevatedButton memiliki properti sebagai berikut:
* autofocus: Menentukan apakah tombol ini akan fokus saat pertama kali ditampilkan.
* clipBehavior: Menentukan apakah konten akan dipotong atau tidak sesuai dengan opsi yang dipilih.
* child: Widget yang akan ditampilkan di dalam tombol.
* enabled: Menentukan apakah tombol ini dapat digunakan atau tidak.
* focusNode: Mengontrol fokus keyboard.
* hashcode: Kode unik untuk objek ini, tidak bisa diubah.
* iconalignment: Menentukan posisi ikon dalam tombol.
* onPressed: Fungsi yang akan dipanggil saat tombol ditekan.
* onHover: Berisikan boolean yang menentukan apakah tombol sedang dihover atau tidak.
* onLongPress: Fungsi yang akan dipanggil saat tombol ditekan lama.

Berikut contoh penggunaan Elevated Button:
```dart
import 'package:flutter/material.dart';

class Elevatedbuttonscreen extends StatelessWidget {
  const Elevatedbuttonscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevated Button Screen'),
      ),
      body: Center(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Respond to button press
              final snackbar = SnackBar(
                content:
                    SnackBarAction(label: 'Tombol Tertekan', onPressed: () {}),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: const Text('Elevated Button'),
          ),
        ),
      ),
    );
  }
}
```

## Text Field
Widget TextField di Flutter adalah elemen input yang memungkinkan pengguna memasukkan teks. Ini digunakan untuk mengumpulkan data dari pengguna. Kita dapat mengontrol teksnya dengan controller, menambahkan dekorasi seperti label atau ikon, dan mengatur jenis keyboard. TextField juga mendukung fitur seperti teks tersamar untuk kata sandi dan callback untuk perubahan teks.

TextField memiliki properti sebagai berikut:
* autocorrect: Menentukan apakah teks yang dimasukkan akan diperbaiki secara otomatis.
* autofocus: Menentukan apakah kolom teks ini akan fokus saat pertama kali ditampilkan.
* autofillhints: Menentukan jenis informasi yang akan diisi secara otomatis oleh sistem.
* buildCounter: Membangun widget yang menampilkan jumlah karakter yang dimasukkan.
* controller: Mengontrol teks yang muncul di kolom teks ini.
* cursorColor: Menentukan warna kursor yang digunakan saat kolom teks ini fokus
* cursorHeight: Menentukan tinggi kursor yang digunakan saat kolom teks ini fokus.
* cursorRadius: Menentukan radius kursor yang digunakan saat kolom teks ini fokus.
* enabled: Menentukan apakah kolom teks ini dapat digunakan atau tidak.
* maxLength: Menentukan jumlah karakter maksimum yang dapat dimasukkan.
* maxLines: Menentukan jumlah baris maksimum yang dapat dimasukkan.
* minLines: Menentukan jumlah baris minimum yang dapat dimasukkan
* onChanged: Fungsi yang akan dipanggil saat teks berubah.
* onEditingComplete: Fungsi yang akan dipanggil saat pengguna menekan tombol selesai di keyboard.
* onTap: Fungsi yang akan dipanggil saat kolom teks ini ditekan.
* onSubmitted: Fungsi yang akan dipanggil saat pengguna menekan tombol selesai di keyboard.
* style: Gaya tertentu yang akan diterapkan pada teks yang dimasukkan.
* textAlign: Penyelarasan teks yang dimasukkan.

Berikut contoh penggunaan Text Field:
```dart
import 'package:flutter/material.dart';

class Textfieldscreen extends StatefulWidget {
  const Textfieldscreen({super.key});

  @override
  _TextfieldscreenState createState() => _TextfieldscreenState();
}

class _TextfieldscreenState extends State<Textfieldscreen> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _text = value;
    });
  }

  void _onSubmitted(String value) {
    setState(() {
      _text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 256,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Enter text here',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('Anda Memasukan Kata: $_text'),
          ],
        ),
      ),
    );
  }
}
```

## Image

Widget Image di Flutter adalah komponen penting yang memungkinkan kita menampilkan gambar dari berbagai sumber dengan opsi kustomisasi yang banyak. Kita dapat memasukan gambar dari aset aplikasi, URL jaringan, file lokal di perangkat pengguna, atau data byte mentah.

Jika menggunakan gambar aset, kita akan menampilkan gambar yang sudah disertakan dalam paket aplikasi, yang ideal untuk ikon atau latar belakang karena tidak memerlukan koneksi internet dan cepat dimuat. Untuk gambar dari jaringan, Kita dapat menggunakan URL untuk mengambil konten dinamis yang bisa diperbarui tanpa memperbarui aplikasi, meskipun ini mungkin memerlukan pengelolaan caching dan placeholder untuk pengalaman pengguna yang lebih baik.

Gambar dari file lokal memungkinkan pengguna mengakses dan menampilkan gambar yang disimpan di perangkat pengguna, sering digunakan dalam aplikasi yang mengelola foto pribadi. Sedangkan penggunaan data byte cocok untuk menampilkan gambar yang dihasilkan atau dimodifikasi langsung dalam aplikasi, memberikan fleksibilitas tambahan untuk manipulasi gambar.

Kita dapat menentukan ukuran dan skala gambar, serta menggunakan berbagai opsi fit untuk menyesuaikan bagaimana gambar ditampilkan dalam ruang yang tersedia, seperti menutupi atau menyesuaikan ke dalam area tampilan. Rasio aspek gambar dapat dipertahankan atau diubah sesuai kebutuhan tampilan, dan penyesuaian posisi memungkinkan Anda mengatur alignment gambar di dalam widget.

Sebagai contoh berikut, saya menggunakan Image.network untuk menampilkan gambar dari internet:
```dart
import 'package:flutter/material.dart';

class Imagescreen extends StatelessWidget {
  const Imagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/images/flutter.png'),
            Image.network(
                fit: BoxFit.cover,
                'https://img.kurio.network/iCNs0vkm69pmD_7HSk4S9LJ-n8E=/320x320/filters:quality(80)/https://kurio-img.kurioapps.com/21/11/02/523b7d41-2228-46d0-8290-33bfdaadd28a.jpe'),
          ],
        ),
      ),
    );
  }
}
```

## Penerapan Container
Container adalah widget yang dapat digunakan untuk mengatur tata letak dan dekorasi dari widget lain. Container memiliki properti seperti alignment, padding, margin, dan decoration yang memungkinkan kita mengatur tata letak dan dekorasi dari widget yang ada di dalamnya.

Berikut contoh penggunaan Container:
```dart
import 'package:flutter/material.dart';

class Containerscreen extends StatelessWidget {
  const Containerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
```

## Icon
Icon adalah widget yang digunakan untuk menampilkan ikon. Flutter menyediakan berbagai ikon bawaan yang dapat digunakan, seperti Icons.home, Icons.favorite, Icons.star, dan lain-lain.

Berikut contoh penggunaan Icon:
```dart
import 'package:flutter/material.dart';

class Iconscreen extends StatelessWidget {
  const Iconscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Screen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.red,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.green,
                ),
                Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.heart_broken,
                  size: 50,
                  color: Colors.red,
                ),
                Icon(
                  Icons.draw_outlined,
                  size: 50,
                  color: Colors.green,
                ),
                Icon(
                  Icons.filter_center_focus_sharp,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
```

## Error Yang Sering Terjadi
Pada saat melakukan experiment praktikum minggu ini saya mengalami beberapa error yang sering terjadi, berikut adalah error yang sering terjadi:

1. Menambahkan const pada data yang dinamis
Error ini terjadi ketika saya menambahkan const pada data yang dinamis, seperti pada contoh berikut:
```dart
const String title = 'Hello World';
```
Solusi dari error ini adalah dengan menghapus const pada data yang dinamis, karena const hanya digunakan untuk data yang statis.
```dart
String title = 'Hello World';
```

