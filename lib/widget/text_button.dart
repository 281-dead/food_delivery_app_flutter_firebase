import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({super.key, required this.name, this.onTap});
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name,
        style: AppWidget.boldTextFieldStyle(),
      ),
    );
  }
}
