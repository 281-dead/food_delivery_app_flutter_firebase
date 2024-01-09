import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, required this.icon, required this.nameHint, required this.hintTextStyle, required this.controller});
  final Icon icon;
  final String nameHint;
  final TextStyle hintTextStyle;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: nameHint,
        hintStyle: hintTextStyle,
      ),
    );
  }
}
