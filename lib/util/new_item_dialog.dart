import 'package:flutter/material.dart';
import 'package:to_do/util/item_button.dart';

class NewItemDialog extends StatelessWidget {
  final controller;
  const NewItemDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new item"),
            ),

            // Save / Cancel buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ItemButton(buttonText: "Save", onPressed: () {}),
                const SizedBox(width: 10),
                ItemButton(buttonText: "Cancel", onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
