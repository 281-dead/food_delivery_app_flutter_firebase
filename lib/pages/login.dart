import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
  String email = "", password = "";
  bool statusLogin = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void userLogin() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login success',
            style: AppWidget.redBoldTextFieldStyle(),
          ),
        ),
      );
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNav()));
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          SnackBar(
            content: Text(
              'No user found for that email',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;
        case "wrong-password":
          SnackBar(
            content: Text(
              'Wrong Password provided by User',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;
        case "user-disabled":
          SnackBar(
            content: Text(
              ' User has been disabled.',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;
        case "Invalid-email":
          SnackBar(
            content: Text(
              'Email address is not valid.',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;
        default:
          break;
      }
    }
  }

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    email = "";
    password = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Login', style: AppWidget.head2LineTextFieldStyle()),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          controller: _email,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email',
                            hintStyle: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: _password,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Password',
                            hintStyle: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
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
                          onTap: () async {
                            final SharedPreferences pref = await SharedPreferences.getInstance();
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                email = _email.text;
                                password = _password.text;
                                statusLogin = true;
                              });
                              pref.setBool('statusLogin', statusLogin);
                              userLogin();
                            }
                          },
                        ),
                      ],
                    ),
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
