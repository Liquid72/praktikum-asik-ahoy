# Laporan Praktikum Flutter: Implementasi GridView  
  
## Daftar Isi
- [GridView Count](#gridview-count)
- [GridView Extent](#gridview-extent)
- [GridView Builder](#gridview-builder)
- [GridView Custom](#gridview-custom)

### 1. GridView Count  
  
#### Deskripsi  
`GridView.count` digunakan untuk membuat grid dengan jumlah kolom tetap. Jumlah item dalam grid dapat diubah dengan menggeser slider.  
  
#### Kode  
```dart  
import 'package:flutter/material.dart';  
  
class Gridviewcountscreen extends StatefulWidget {  
  const Gridviewcountscreen({super.key});  
  _GridviewcountscreenState createState() => _GridviewcountscreenState();  
}  
  
class _GridviewcountscreenState extends State<Gridviewcountscreen> {  
  int counter = 1;  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('GridView Count'),  
      ),  
      body: Column(  
        children: [  
          Slider(  
            value: counter.toDouble(),  
            min: 1,  
            max: 10,  
            divisions: 8,  
            label: '$counter',  
            onChanged: (double value) {  
              setState(() {  
                counter = value.toInt();  
              });  
            },  
          ),  
          Expanded(  
            child: GridView.count(  
              crossAxisCount: 2,  
              children: List.generate(counter, (index) {  
                return Center(  
                  child: SizedBox(  
                    height: 100,  
                    width: 100,  
                    child: Card(  
                      color: Colors.blue,  
                      child: Center(  
                        child: Text(  
                          'Item ${index + 1}',  
                          style: const TextStyle(  
                            color: Colors.white,  
                            fontSize: 20,  
                          ),  
                        ),  
                      ),  
                    ),  
                  ),  
                );  
              }),  
            ),  
          )  
        ],  
      ),  
    );  
  }  
}  
```
 

## GridView Extent
 

### Deskripsi
GridView.extent memungkinkan penentuan ukuran maksimal dari setiap item dalam grid, sehingga jumlah kolom dapat bervariasi berdasarkan ukuran layar.

### Kode
```dart
import 'package:flutter/material.dart';  
  
class Gridviewextentscreen extends StatefulWidget {  
  const Gridviewextentscreen({super.key});  
  _GridviewextentscreenState createState() => _GridviewextentscreenState();  
}  
  
class _GridviewextentscreenState extends State<Gridviewextentscreen> {  
  int counter = 1;  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('GridView Extent'),  
      ),  
      body: Column(  
        children: [  
          Slider(  
            value: counter.toDouble(),  
            min: 1,  
            max: 10,  
            divisions: 8,  
            label: '$counter',  
            onChanged: (double value) {  
              setState(() {  
                counter = value.toInt();  
              });  
            },  
          ),  
          Expanded(  
            child: GridView.extent(  
              maxCrossAxisExtent: 200,  
              children: List.generate(counter, (index) {  
                return Center(  
                  child: SizedBox(  
                    height: 100,  
                    width: 100,  
                    child: Card(  
                      color: Colors.blue,  
                      child: Center(  
                        child: Text(  
                          'Item ${index + 1}',  
                          style: const TextStyle(  
                            color: Colors.white,  
                            fontSize: 20,  
                          ),  
                        ),  
                      ),  
                    ),  
                  ),  
                );  
              }),  
            ),  
          )  
        ],  
      ),  
    );  
  }  
}  
 ```

## GridView Builder
 

### Deskripsi
GridView.builder digunakan ketika jumlah item dalam grid tidak diketahui sebelumnya. Memungkinkan pembuatan grid dinamis.

Kode
```dart
import 'package:flutter/material.dart';  
import 'package:flutter/widgets.dart';  
  
class Gridviewbuilderscreen extends StatefulWidget {  
  const Gridviewbuilderscreen({super.key});  
  _GridviewbuilderscreenState createState() => _GridviewbuilderscreenState();  
}  
  
class _GridviewbuilderscreenState extends State<Gridviewbuilderscreen> {  
  int counter = 1;  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('GridView Builder'),  
      ),  
      body: Column(  
        children: [  
          Slider(  
            value: counter.toDouble(),  
            min: 1,  
            max: 10,  
            divisions: 8,  
            label: '$counter',  
            onChanged: (double value) {  
              setState(() {  
                counter = value.toInt();  
              });  
            },  
          ),  
          Expanded(  
            child: GridView.builder(  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: 2,  
              ),  
              itemBuilder: (BuildContext context, int index) {  
                return Card(  
                  color: Colors.blue,  
                  child: Center(  
                    child: Text(  
                      '$index',  
                      style: const TextStyle(  
                        color: Colors.white,  
                        fontSize: 20,  
                      ),  
                    ),  
                  ),  
                );  
              },  
              itemCount: counter,  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
 
```
## GridView Custom
 

### Deskripsi
GridView.custom memberikan fleksibilitas penuh dalam mengatur grid, memungkinkan penggunaan SliverChildBuilderDelegate untuk mengelola item.

### Kode
```dart
import 'package:flutter/material.dart';  
  
class Gridviewcustomscreen extends StatefulWidget {  
  const Gridviewcustomscreen({super.key});  
  _GridviewcustomscreenState createState() => _GridviewcustomscreenState();  
}  
  
class _GridviewcustomscreenState extends State<Gridviewcustomscreen> {  
  int counter = 1;  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('GridView Custom'),  
      ),  
      body: Column(  
        children: [  
          Slider(  
            value: counter.toDouble(),  
            min: 1,  
            max: 10,  
            divisions: 8,  
            label: '$counter',  
            onChanged: (double value) {  
              setState(() {  
                counter = value.toInt();  
              });  
            },  
          ),  
          Expanded(  
            child: GridView.custom(  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: 2,  
              ),  
              childrenDelegate: SliverChildBuilderDelegate(  
                (BuildContext context, int index) {  
                  return Card(  
                    color: Colors.blue,  
                    child: Center(  
                      child: Text(  
                        '$index',  
                        style: const TextStyle(  
                          color: Colors.white,  
                          fontSize: 20,  
                        ),  
                      ),  
                    ),  
                  );  
                },  
                childCount: counter,  
              ),  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  
 ```

