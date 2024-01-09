import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottomNav.dart';
import 'package:flutter_application_1/pages/forget.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/log_button.dart';
import 'package:flutter_application_1/widget/text-field.dart';
import 'package:flutter_application_1/widget/text_button.dart';
import 'package:flutter_application_1/widget/widget-support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late bool isLogin;
  //

  void loginConfirmation() async {
    //get  local
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email')!;
    String password = pref.getString('password')!;
    String message = "";

    //auth
    if (_email.toString() == email && _password.toString() == password) {
      message = "Login Success";
      isLogin = await pref.setBool('isLogin', true);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      });
    } else {
      message = "Login failed";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.red,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.9),
              child: Row(
                children: [
                  const SizedBox(width: 35),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.white70)),
                  const Text(
                    'Food Delivery',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 30, color: Colors.white70),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 2),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.vertical(
                  top: Radius.elliptical(MediaQuery.of(context).size.width, 105),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Login', style: AppWidget.head2LineTextFieldStyle()),
                      TextFieldCustom(controller: _email, icon: const Icon(Icons.email), nameHint: 'Email', hintTextStyle: AppWidget.boldTextFieldStyle()),
                      const SizedBox(height: 20),
                      TextFieldCustom(controller: _password, icon: const Icon(Icons.password), nameHint: 'Password', hintTextStyle: AppWidget.boldTextFieldStyle()),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButtonCustom(
                            name: 'Forget Password?',
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPage()));
                            }),
                      ),
                      const Spacer(),
                      LogButton(
                        name: 'Login',
                        onTap: loginConfirmation,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Aready have an account?  ", style: AppWidget.bold2TextFieldStyle()),
                  TextButtonCustom(
                    name: 'SignUp',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
