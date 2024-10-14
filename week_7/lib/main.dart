import 'package:flutter/material.dart';
import 'package:week_7/Screen/homepage.dart';
import 'package:week_7/Screen/login.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 230, 0),
      brightness: Brightness.light),
  scaffoldBackgroundColor: const ColorScheme.light().surface,
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/homepage': (context) => const Homepage(),
      },
      initialRoute: '/login',
    );
  }
}
