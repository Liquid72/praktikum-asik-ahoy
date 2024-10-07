import 'package:flutter/material.dart';
import 'package:week_5/screen/gridViewBuilderScreen.dart';
import 'package:week_5/screen/gridViewCountScreen.dart';
import 'package:week_5/screen/gridViewCustomScreen.dart';
import 'package:week_5/screen/gridViewExtentScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/count': (context) => const Gridviewcountscreen(),
        '/extent': (context) => const Gridviewextentscreen(),
        '/builder': (context) => const Gridviewbuilderscreen(),
        '/custom': (context) => const Gridviewcustomscreen(),
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/count');
              },
              child: const Text('GridView Count'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/extent');
              },
              child: const Text('GridView Extent'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/builder');
              },
              child: const Text('GridView Builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/custom');
              },
              child: const Text('GridView Custom'),
            ),
          ],
        ),
      ),
    );
  }
}
