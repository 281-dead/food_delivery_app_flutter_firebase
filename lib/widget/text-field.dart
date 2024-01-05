import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, required this.icon, required this.nameHint, required this.hintTextStyle});
  final Icon icon;
  final String nameHint;
  final TextStyle hintTextStyle;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: nameHint,
        hintStyle: hintTextStyle,
      ),
    );
  }
}
