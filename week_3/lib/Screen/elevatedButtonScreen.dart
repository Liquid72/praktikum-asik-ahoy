import 'package:flutter/material.dart';

class Elevatedbuttonscreen extends StatelessWidget {
  const Elevatedbuttonscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevated Button Screen'),
      ),
      body: Center(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Respond to button press
              final snackbar = SnackBar(
                content:
                    SnackBarAction(label: 'Tombol Tertekan', onPressed: () {}),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: const Text('Elevated Button'),
          ),
        ),
      ),
    );
  }
}
