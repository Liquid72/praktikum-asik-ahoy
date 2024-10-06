import 'package:flutter/material.dart';

class Imagescreen extends StatelessWidget {
  const Imagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/images/flutter.png'),
            Image.network(
                fit: BoxFit.cover,
                'https://img.kurio.network/iCNs0vkm69pmD_7HSk4S9LJ-n8E=/320x320/filters:quality(80)/https://kurio-img.kurioapps.com/21/11/02/523b7d41-2228-46d0-8290-33bfdaadd28a.jpe'),
          ],
        ),
      ),
    );
  }
}
