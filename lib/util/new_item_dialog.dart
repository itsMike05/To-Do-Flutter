import 'package:flutter/material.dart';

class NewItemDialog extends StatelessWidget {
  const NewItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            // Get user input
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            // Save / Cancel buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: null, child: Text("Save")),
                ElevatedButton(onPressed: null, child: Text("Cancel")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
