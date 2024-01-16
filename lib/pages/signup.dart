import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottomNav.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/widget/log_button.dart';
import 'package:flutter_application_1/widget/text-field.dart';
import 'package:flutter_application_1/widget/text_button.dart';
import 'package:flutter_application_1/widget/widget-support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String email = "", password = "", name = "";
  final formKey = GlobalKey<FormState>();

  //add account user
  addNewAccount() async {
    //create new userAccount save on fireStore
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Signup success',
            style: AppWidget.redBoldTextFieldStyle(),
          ),
        ),
      );
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNav()));
      });
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          SnackBar(
            content: Text(
              'Your email invalid',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;

        case 'email-already-in-use':
          SnackBar(
            content: Text(
              'there already exists an account with the given email address.',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;

        case 'weak-password':
          SnackBar(
            content: Text(
              'the password is not strong enough.',
              style: AppWidget.redBoldTextFieldStyle(),
            ),
          );
          break;
        default:
          return null;
      }
    }
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    email = "";
    password = "";
    name = "";
    super.dispose();
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
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white70,
                      )),
                  const Text(
                    'Food Delivery',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      color: Colors.white70,
                    ),
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
                  //margin: const EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Signup', style: AppWidget.head2LineTextFieldStyle()),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Name',
                            hintStyle: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email',
                            hintStyle: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Password',
                            hintStyle: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                        const Spacer(),
                        LogButton(
                          name: 'SignUp',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              SharedPreferences pref = await SharedPreferences.getInstance();
                              setState(() {
                                email = _emailController.text;
                                password = _passwordController.text;
                                name = _nameController.text;
                              });
                              addNewAccount();
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
                  Text("Already have an account?  ", style: AppWidget.bold2TextFieldStyle()),
                  TextButtonCustom(
                    name: 'Login',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
