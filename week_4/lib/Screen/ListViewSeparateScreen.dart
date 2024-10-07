import 'package:flutter/material.dart';

class Listviewseparatescreen extends StatefulWidget {
  const Listviewseparatescreen({Key? key}) : super(key: key);

  @override
  _ListViewSeparateScreenState createState() => _ListViewSeparateScreenState();
}

class _ListViewSeparateScreenState extends State<Listviewseparatescreen> {
  @override
  int itemCount = 10;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: Column(
        children: <Widget>[
          // Create a slider to control the number of items in the ListView
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
