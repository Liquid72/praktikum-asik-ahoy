import 'package:flutter/material.dart';

class Listviewcustomscreen extends StatefulWidget {
  const Listviewcustomscreen({Key? key}) : super(key: key);

  @override
  _ListViewCustomScreenState createState() => _ListViewCustomScreenState();
}

class _ListViewCustomScreenState extends State<Listviewcustomscreen> {
  @override
  int itemCount = 10;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.custom'),
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
