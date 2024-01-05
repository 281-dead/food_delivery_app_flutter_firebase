import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/order.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/wallet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homepage;
  late ProfilePage profile;
  late OrderPage orderPage;
  late WalletPage walletPage;

  @override
  void initState() {
    // TODO: implement initState
    homepage = const HomePage();
    profile = const ProfilePage();
    orderPage = const OrderPage();
    walletPage = const WalletPage();
    pages = [homepage, orderPage, profile, walletPage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        height: 65,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (value) {
          currentTabIndex = value;
          setState(() {});
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.card_travel,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.monetization_on_sharp,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
