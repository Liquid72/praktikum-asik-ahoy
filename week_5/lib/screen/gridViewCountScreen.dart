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
            // Slider
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
        ));
  }
}
