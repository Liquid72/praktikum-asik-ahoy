import 'package:flutter/material.dart';

class Iconscreen extends StatelessWidget {
  const Iconscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Screen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.red,
                ),
                Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.green,
                ),
                Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.heart_broken,
                  size: 50,
                  color: Colors.red,
                ),
                Icon(
                  Icons.draw_outlined,
                  size: 50,
                  color: Colors.green,
                ),
                Icon(
                  Icons.filter_center_focus_sharp,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
