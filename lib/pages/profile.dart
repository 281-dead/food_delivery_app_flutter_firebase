import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginPage.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Hoàng Cường',
                  style: AppWidget.whiteBoldTextFieldStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
                  child: Material(
                    borderRadius: BorderRadius.circular(60),
                    elevation: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'images/profile.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.black, size: 40),
                  title: Text('Name', style: AppWidget.boldTextFieldStyle()),
                  subtitle: Text(
                    'Hoàng Văn Cường',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.black, size: 40),
                  title: Text('Email', style: AppWidget.boldTextFieldStyle()),
                  subtitle: Text(
                    'hoangcuong45c@gmail.com',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: ListTile(
                  leading: const Icon(Icons.delete, color: Colors.black, size: 40),
                  title: Text('Delete Account', style: AppWidget.boldTextFieldStyle()),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.black, size: 40),
                  title: Text('LogOut', style: AppWidget.boldTextFieldStyle()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
