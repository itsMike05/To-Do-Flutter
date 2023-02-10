import 'package:flutter/material.dart';
import 'package:to_do/util/item_button.dart';

// ignore: must_be_immutable
class NewItemDialog extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  final TextEditingController controller;
  NewItemDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Add a new item"),
              ),
            ),

            // Save / Cancel buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ItemButton(buttonText: "Save", onPressed: onSave),
                const SizedBox(width: 10),
                ItemButton(buttonText: "Cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
