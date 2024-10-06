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
