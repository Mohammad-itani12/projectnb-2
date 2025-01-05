import 'package:flutter/material.dart';
import 'resources_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalized Learning Resource Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResourcesScreen(),
    );
  }
}