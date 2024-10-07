# Week 6
 

## Daftar Isi
- [Navigator Push & Pop](#navigator-push--pop)
- [Navigator Replacement](#navigator-replacement)
- [Navigator PushAndRemoveUntil](#navigator-pushandremoveuntil)
- [Inisialisasi Named Route](#inisialisasi-named-route)
- [Membuat Halaman Utama](#membuat-halaman-utama)
- [Membuat Halaman Detail](#membuat-halaman-detail)
- [Bottom Navbar](#bottom-navbar)
 

## Navigator Push & Pop
### Navigator Push

Konsep: Menambahkan halaman baru ke atas stack navigasi, memungkinkan pengguna untuk berpindah ke halaman tersebut.
Penggunaan: Ideal untuk navigasi ke halaman baru tanpa mengganggu halaman sebelumnya.
Implementasi:
```dart
Navigator.push(  
  context,  
  MaterialPageRoute(builder: (context) => HalamanBaru()),  
);  
```
Penjelasan: MaterialPageRoute adalah widget yang menyediakan transisi halaman dengan animasi material design.

### Navigator Pop
Konsep: Menghapus halaman saat ini dari stack, sehingga kembali ke halaman sebelumnya.
Penggunaan: Cocok untuk operasi "kembali" atau "tutup".
Implementasi:

Navigator.pop(context);  
Penjelasan: Memanggil pop mengurangi stack navigasi, memastikan bahwa pengguna kembali ke halaman sebelumnya.
## Navigator Replacement
Konsep: Mengganti halaman saat ini dengan halaman baru, tanpa menambahkannya ke stack navigasi.
Penggunaan: Berguna ketika halaman saat ini tidak diperlukan lagi dalam stack.
Implementasi:
```dart
Navigator.pushReplacement(  
  context,  
  MaterialPageRoute(builder: (context) => HalamanPengganti()),  
);  
```
Penjelasan: pushReplacement memastikan bahwa halaman baru menggantikan halaman yang ada, menjaga stack tetap efisien.
## Navigator PushAndRemoveUntil
Konsep: Menambahkan halaman baru dan menghapus semua halaman sebelumnya sampai kondisi tertentu terpenuhi.
Penggunaan: Berguna untuk membersihkan stack setelah login atau saat berpindah ke halaman utama.
Implementasi:
```dart
Navigator.pushAndRemoveUntil(  
  context,  
  MaterialPageRoute(builder: (context) => HalamanBaru()),  
  (Route<dynamic> route) => false,  
);  
```
Penjelasan: Kondisi (Route<dynamic> route) => false menghapus semua halaman sebelumnya, memastikan hanya halaman baru yang tersisa di stack.
## Inisialisasi Named Route
Konsep: Menggunakan nama untuk mengidentifikasi dan menavigasi antar halaman, membuat kode lebih bersih dan mudah dikelola.
Penggunaan: Memudahkan navigasi terutama dalam aplikasi besar dengan banyak halaman.
Implementasi:
```dart
MaterialApp(  
  initialRoute: '/',  
  routes: {  
    '/': (context) => HalamanUtama(),  
    '/detail': (context) => HalamanDetail(),  
  },  
);  
```
Navigasi:
```dart
Navigator.pushNamed(context, '/detail');  
```
Penjelasan: initialRoute menentukan halaman awal, sementara routes mendefinisikan peta dari nama rute ke widget.
## Membuat Halaman Utama
Konsep: Halaman utama berfungsi sebagai titik masuk aplikasi.
Penggunaan: Tempatkan elemen UI yang paling penting atau sering digunakan.
Implementasi:
```dart
class HalamanUtama extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text("Halaman Utama")),  
      body: Center(  
        child: ElevatedButton(  
          onPressed: () {  
            Navigator.pushNamed(context, '/detail');  
          },  
          child: Text("Pergi ke Detail"),  
        ),  
      ),  
    );  
  }  
}  
```
Penjelasan: Menggunakan Scaffold untuk struktur dasar halaman dengan AppBar dan ElevatedButton untuk navigasi.
6. Membuat Halaman Detail
Konsep: Halaman detail menampilkan informasi lebih lanjut yang terkait dengan item atau pilihan dari halaman utama.
Penggunaan: Menampilkan detail produk, profil pengguna, atau informasi spesifik lainnya.
Implementasi:
```dart
class HalamanDetail extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text("Halaman Detail")),  
      body: Center(  
        child: ElevatedButton(  
          onPressed: () {  
            Navigator.pop(context);  
          },  
          child: Text("Kembali"),  
        ),  
      ),  
    );  
  }  
}  
```

Penjelasan: Menyediakan tombol untuk kembali ke halaman sebelumnya, memanfaatkan Navigator.pop.
7. Bottom Navbar
Konsep: Menyediakan navigasi cepat antar halaman utama dalam aplikasi.
Penggunaan: Mempermudah akses ke fitur utama seperti beranda, pencarian, dan profil.
Implementasi:
```dart
class MainPage extends StatefulWidget {  
  @override  
  _MainPageState createState() => _MainPageState();  
}  
```
```dart
class _MainPageState extends State<MainPage> {  
  int _selectedIndex = 0;  

  static const List<Widget> _widgetOptions = <Widget>[  
    HalamanUtama(),  
    HalamanDetail(),  
  ];  

  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: _widgetOptions.elementAt(_selectedIndex),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),  
          BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Detail'),  
        ],  
        currentIndex: _selectedIndex,  
        onTap: _onItemTapped,  
      ),  
    );  
  }  
}  
```
Penjelasan: BottomNavigationBar memungkinkan pengguna beralih antar halaman. currentIndex melacak halaman yang sedang aktif.
Kesimpulan
Penggunaan navigator dan named routes di Flutter memungkinkan manajemen navigasi yang efektif dan efisien. Implementasi bottom navigation bar memberikan pengalaman pengguna yang lebih baik dengan menyediakan akses cepat ke fitur utama.