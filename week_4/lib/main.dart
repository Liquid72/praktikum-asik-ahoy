import 'package:flutter/material.dart';
import 'package:week_4/Screen/ListViewBuilderScreen.dart';
import 'package:week_4/Screen/ListViewCustomScreen.dart';
import 'package:week_4/Screen/ListViewSeparateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const MainMenu(),
        '/builder': (context) => const Listviewbuilderscreen(),
        '/separate': (context) => const Listviewseparatescreen(),
        '/custom': (context) => const Listviewcustomscreen(),
      },
      initialRoute: '/home',
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/builder');
              },
              child: const Text('ListView.Builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/separate');
              },
              child: const Text('ListView.Separated'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/custom');
              },
              child: const Text('ListView.Custom'),
            ),
          ],
        ),
      ),
    );
  }
}
