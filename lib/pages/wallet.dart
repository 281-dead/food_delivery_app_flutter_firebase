import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    int wallet = 0;

    @override
    void initState() {
      super.initState();
    }

    void add() {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Wallet', style: AppWidget.headLineTextFieldStyle()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFF0EEF0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('images/wallet.png', height: 50, width: 50, fit: BoxFit.cover),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Your Wallet', style: AppWidget.LightTextFieldStyle()),
                    Text(
                      '\$ $wallet',
                      style: AppWidget.headLineTextFieldStyle(),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Add Money',
              style: AppWidget.boldTextFieldStyle(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.height / 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        wallet += 100;
                      });
                    },
                    child: Text('\$100', style: AppWidget.boldTextFieldStyle(), textAlign: TextAlign.center),
                  ),
                ),
              ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.height / 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        wallet += 500;
                      });
                    },
                    child: Text('\$500', style: AppWidget.boldTextFieldStyle(), textAlign: TextAlign.center),
                  ),
                ),
              ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.height / 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        wallet += 1000;
                      });
                    },
                    child: Text('\$1000', style: AppWidget.boldTextFieldStyle(), textAlign: TextAlign.center),
                  ),
                ),
              ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.height / 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        wallet += 5000;
                      });
                    },
                    child: Text('\$5000', style: AppWidget.boldTextFieldStyle(), textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 30),
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.height / 2,
            height: MediaQuery.of(context).size.height / 9,
            child: GestureDetector(
              onTap: add,
              child: Text(
                'Add Money',
                style: AppWidget.whiteBoldTextFieldStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SnackBar snackBar = SnackBar(
    backgroundColor: const Color(0xFFC2C2C2),
    duration: const Duration(seconds: 3),
    content: Text(
      'Tài khoản đã cộng thêm tiền',
      style: AppWidget.boldTextFieldStyle(),
    ),
  );
}
