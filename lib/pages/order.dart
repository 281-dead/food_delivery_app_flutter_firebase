import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String nameFood = "Burger";
  int priceFood = 350;
  int quantity = 1;

  // @override
  // void initState() {
  //   nameFood = "Burger";
  //   priceFood = 350;
  //   quantity = 1;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Food Cart', style: AppWidget.headLineTextFieldStyle()),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(top: 10),
                      height: 90,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black45,
                        width: 1.0,
                      )),
                      child: Text(
                        quantity.toString(),
                        style: AppWidget.headLineTextFieldStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'images/salad4.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nameFood.toString(),
                          style: AppWidget.bold2TextFieldStyle(),
                        ),
                        Text(
                          priceFood.toString(),
                          style: AppWidget.bold2TextFieldStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Divider(color: Colors.black38, height: 1.0),
            Container(
              height: MediaQuery.of(context).size.width / 3,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                      Text(
                        '\$ 350',
                        style: AppWidget.head2LineTextFieldStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {},
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        padding: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'CheckOut',
                          style: AppWidget.lightWhiteTextFieldStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
