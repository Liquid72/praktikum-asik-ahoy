import 'package:flutter/material.dart';

class Listviewbuilderscreen extends StatefulWidget {
  const Listviewbuilderscreen({Key? key}) : super(key: key);

  @override
  _ListViewBuilderScreenState createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<Listviewbuilderscreen> {
  @override
  int itemCount = 10;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView.builder'),
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
