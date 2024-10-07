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
