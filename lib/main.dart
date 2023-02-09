import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/pages/homepage.dart';

void main() async {
  // Initializing the Hive
  await Hive.initFlutter();
  // MAKE SURE TO ADD 'await' HERE !!!!!!!!!!!
  var dataBox = await Hive.openBox('data_box');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const Homepage(),
    );
  }
}
