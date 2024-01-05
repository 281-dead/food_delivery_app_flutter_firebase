import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class LogButton extends StatelessWidget {
  const LogButton({super.key, required this.name, this.isLoading = false, this.onTap});
  final String name;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading
          ? const CircularProgressIndicator()
          : Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 40,
                width: MediaQuery.of(context).size.height / 2,
                child: Text(
                  name,
                  style: AppWidget.whiteBoldTextFieldStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
