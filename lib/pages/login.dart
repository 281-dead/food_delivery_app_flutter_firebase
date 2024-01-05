import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottomNav.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text('Login', style: AppWidget.head2LineTextFieldStyle()),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Email',
                          hintStyle: AppWidget.boldTextFieldStyle(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          hintText: 'Password',
                          hintStyle: AppWidget.boldTextFieldStyle(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const BottomNav()),
                            (route) => false,
                          );
                        },
                        child: Material(
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
                              'Login',
                              style: AppWidget.whiteBoldTextFieldStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
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
                  Text("Don't have an account ", style: AppWidget.bold2TextFieldStyle()),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'SignUp',
                        style: AppWidget.boldTextFieldStyle(),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
