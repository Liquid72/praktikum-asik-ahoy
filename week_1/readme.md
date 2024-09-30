# Praktikum Minggu Pertama

## Daftar Isi

- [Review Bahasa Pemrograman](#pendahuluan)
- [Instalasi Flutter](#instalasi-flutter)
- [Cek Hasil Instalasi Flutter](#cek-hasil-instalasi-flutter)
- [Membuat Hello World](#membuat-hello-world)

## Review Bahasa Pemrograman

### Web Programming

#### React (JavaScript)

Dalam kasus ini saya memilih React (JavaScript) pertama kali karena dapat berperan sebagai frontend serta backend sekaligus dan dukungan komunitas yang sangat besar, Berkat dukungan komunitas yang besar membuat React menjadi framework web yang cocok untuk dipelajari untuk semua kalangan. Dengan Node.JS membuat React memiliki performa yang sangat baik dibandingkan dengan pesaingnya seperti Django pada Python.

#### .NET Core (C#)

Meski popularitasnya tidak setinggi dengan React (JavaScript), .Net memiliki kelebihan dalam bidang performa dan stabilitas jika dibandingkan dengan React, Akan tetapi pada industri enterprise tertentu masih menggunakan .Net Core karena teknologinya sudah stabil. Menurut survey Developer Ecosystem yang dilakukan oleh Jetbrains (Jetbrains, 2023) bahasa pemrograman C# masih kalah tenar dari React (JavaScript) dengan persentase pengguna 61% namun C# masih lebih unggul daripada PHP dengan persentase pengguna sebesar 21% sedangkan PHP 18%.

#### PHP

Tidak dapat dipungkiri bahwa hingga saat ini mayoritas pemerintah dan industri kecil dan menengah di Indonesia masih menggunakan PHP, sehingga permintaan developer PHP di Indonesia sangatlah tinggi, selain itu diantara Node.JS dan .Net, PHP merupakan bahasa pemrograman pada platform web yang sangat cepat untuk dikembangkan, sehingga bahasa pemrogramman ini merupakan bahasa pemrograman yang paling sering mendatangkan cuan.

### Mobile

#### Flutter (Dart)

Flutter yang menawarkan kemampuan multiplatform memberikan daya tarik tersendiri bagi developer aplikasi berbasis mobile. Framework Flutter dapat digunakan dengan menggunakan bahasa pemrogramman Dart, dengan sintakis yang mirip dengan JavaScript, membuat bahasa pemrogramman ini mudah dipahami terutama untuk developer web yang ingin mengembangkan aplikasi mobile.
React Native (JavaScript)
React Native merupakan framework multiplatform untuk mengembangkan aplikasi mobile dengan prinsip “Pelajari Sekali, Ditulis dimana-mana”. Karena masih memiliki basis yang sama dengan React, web developer yang ingin membuat aplikasi dapat mempelajari React Native dengan cepat apabila sebelumnya sudah memahami dasar-dasar pada React Native.

### Desktop

#### Electron (JavaScript)

Dengan melakukan bundling antara Chromium dan Node.JS, Electron dapat membuat aplikasi web menjadi aplikasi desktop, Electron menjadi populer semenjak banyak aplikasi besar seperti Discord, Figma dan Microsoft Teams. Electron memberikan fleksibilitas yang tinggi kepada developer web untuk melakukan pengembangan aplikasi desktop.

#### .NET (C#)

.Net dapat dikembangkan kedalam beberapa platform salah satunya desktop, Ketika mengembangkan aplikasi desktop menggunakan .Net kita dapat melakukan kompilasi antar sistem operasi desktop. Berkat kemampuan yang dapat mengembangkan perangkat lintas platform menjadikan .NET sebagai framework yang berpotensi dimasa depan.

### Embedded System

#### Arduino (C++)

C++ telah menjadi pionir bahasa pemrograman pada sistem tertanam atau Embedded System karena sistemnya yang minimalis membuat bahasa pemrograman ini tidak memerlukan banyak penyimpanan dimana sangat cocok untuk diimplementasikan pada sistem tertanam karena tidak memiliki banyak penyimpanan, karena ukuran file yang dimasukan pada sistem tanam merupakan hal yang krusial.

## Instalasi Flutter

1. Download Flutter SDK di [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2. Extract file zip Flutter SDK yang sudah di download
3. Pindahkan folder Flutter SDK ke direktori yang diinginkan
4. Tambahkan path Flutter SDK ke PATH Environment
5. Install Flutter Plugin di Visual Studio Code
6. Install Dart Plugin di Visual Studio Code

## Cek Hasil Instalasi Flutter

Untuk melakukan pengecekan hasil instalasi Flutter, buka terminal dan ketik perintah berikut:
`bash flutter doctor`

kemudian akan muncul hasil pengecekan seperti berikut:

````bash
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 2.8.1, on Microsoft Windows 
[Version 10.0.19042.1526], locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 32.0.0)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)
[✓] VS Code (version 1.63.2)
[✓] Connected device (2 available)```

````

## Membuat Hello World

1. Buka Visual Studio Code
2. Buat project baru dengan perintah `bash flutter create hello_world`
3. Buka folder project yang sudah dibuat
4. Buka file `lib/main.dart`
5. Ubah kode program menjadi seperti berikut:

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
