import 'package:flutter/material.dart';
import 'package:week_3/Screen/alignScreen.dart';
import 'package:week_3/Screen/containerScreen.dart';
import 'package:week_3/Screen/elevatedButtonScreen.dart';
import 'package:week_3/Screen/iconScreen.dart';
import 'package:week_3/Screen/imageScreen.dart';
import 'package:week_3/Screen/paddingScreen.dart';
import 'package:week_3/Screen/stackScreen.dart';
import 'package:week_3/Screen/textFieldScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Week 3 Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => const menuApp(),
      '/stackScreen': (context) => const Stackscreen(),
      '/paddingScreen': (context) => const Paddingscreen(),
      '/alignScreen': (context) => const Alignscreen(),
      '/elevatedButtonScreen': (context) => const Elevatedbuttonscreen(),
      '/textFieldScreen': (context) => const Textfieldscreen(),
      '/imageScreen': (context) => const Imagescreen(),
      '/containerScreen': (context) => const Containerscreen(),
      '/iconScreen': (context) => const Iconscreen()
    },
  ));
}

class menuApp extends StatelessWidget {
  const menuApp({super.key});

  final double universalButtonWidth = 256;
  final double universalButtonHeight = 48;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 3 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 179, 177, 184)),
        useMaterial3: true,
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Week 3 Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/stackScreen');
                },
                child: const Text('Stack Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/paddingScreen');
                },
                child: const Text('Padding Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/alignScreen');
                },
                child: const Text('Align Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/elevatedButtonScreen');
                },
                child: const Text('Elevated Button Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/textFieldScreen');
                },
                child: const Text('Text Field Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/imageScreen');
                },
                child: const Text('Image Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/containerScreen');
                },
                child: const Text('Penerapan Container Screen'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(universalButtonWidth, universalButtonHeight),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/iconScreen');
                },
                child: const Text('Icon Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
