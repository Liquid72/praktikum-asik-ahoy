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
