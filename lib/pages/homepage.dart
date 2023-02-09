import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "TO DO",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 30, letterSpacing: 5),
          ),
        ),
      ),
    );
  }
}
