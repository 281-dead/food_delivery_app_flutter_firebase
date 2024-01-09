import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/text-field.dart';
import 'package:flutter_application_1/widget/text_button.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF010001),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text('PassWord Recovery',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            Text('Enter Your Email', style: AppWidget.lightWhiteTextFieldStyle()),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white54,
                  )),
              child: TextFieldCustom(
                controller: emailController,
                icon: const Icon(Icons.email, color: Colors.white70),
                nameHint: 'Email',
                hintTextStyle: const TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white54,
                      )),
                  child: Center(child: Text('Send Email', style: AppWidget.boldTextFieldStyle()))),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?  ", style: AppWidget.lightWhiteTextFieldStyle()),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic,
                      color: Colors.yellow[200],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
