import 'dart:async';

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
  //add account user
  void addNewAccount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('name', _nameController.toString());
    pref.setString('email', _emailController.toString());
    pref.setString('password', _passwordController.toString());
    //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signup success')));

    Timer(const Duration(seconds: 5), () {});
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
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.height / 2,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Signup', style: AppWidget.head2LineTextFieldStyle()),
                      TextFieldCustom(controller: _nameController, icon: const Icon(Icons.person), nameHint: 'Name', hintTextStyle: AppWidget.boldTextFieldStyle()),
                      const SizedBox(height: 20),
                      TextFieldCustom(controller: _emailController, icon: const Icon(Icons.email), nameHint: 'Email', hintTextStyle: AppWidget.boldTextFieldStyle()),
                      const SizedBox(height: 20),
                      TextFieldCustom(controller: _passwordController, icon: const Icon(Icons.password), nameHint: 'Password', hintTextStyle: AppWidget.boldTextFieldStyle()),
                      const Spacer(),
                      LogButton(
                          name: 'SignUp',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      elevation: 10,
                                      content: Column(
                                        children: [
                                          Text('Sign Up Success', style: AppWidget.bold2TextFieldStyle()),
                                          GestureDetector(
                                            child: const Text('Ok'),
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                    ));
                          })
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
