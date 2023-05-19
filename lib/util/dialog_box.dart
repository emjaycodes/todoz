// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

import 'myButton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),

            //buttons = save annd cancel,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // save button
                Mybutton(
                  ButtonText: 'save',
                  onPressed: onSave
                ),

                // cancel button
                Mybutton(
                  ButtonText: 'Cancel',
                  onPressed: onCancel
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
