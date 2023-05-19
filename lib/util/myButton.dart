import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
   Mybutton({super.key, required this.ButtonText, required this.onPressed});

  final String ButtonText;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(ButtonText),
    );
  }
}
