import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detailPage.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iceCream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chào Cường,',
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Món ngon',
                  style: AppWidget.headLineTextFieldStyle(),
                ),
                Text(
                  'Thưởng thức những món ăn tuyệt vời',
                  style: AppWidget.LightTextFieldStyle(),
                ),
                const SizedBox(height: 20),
                showItem(),
                const SizedBox(height: 20),
                GestureDetector(
                  child: Text(
                    'Đề xuất cho bạn  ->',
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 5.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(padding: const EdgeInsets.only(left: 18), child: Image.asset('images/salad2.png', height: 100, width: 100, fit: BoxFit.cover)),
                                          Text('Salad Royal', style: AppWidget.boldTextFieldStyle()),
                                          Text('Fresh And heathy', style: AppWidget.LightTextFieldStyle()),
                                          Text('\$25', style: AppWidget.headLineTextFieldStyle()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          child: Material(
                            borderRadius: BorderRadius.circular(15),
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset('images/salad2.png', height: 100, width: 100, fit: BoxFit.cover),
                                  Column(
                                    children: [
                                      Text('Salad Royal', style: AppWidget.boldTextFieldStyle()),
                                      Text('Fresh And heathy', style: AppWidget.LightTextFieldStyle()),
                                      Text('\$25', style: AppWidget.headLineTextFieldStyle()),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: iceCream ? Colors.black : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/ice-cream.png', color: iceCream ? Colors.white : Colors.black, height: 50, width: 50, fit: BoxFit.cover),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/pizza.png', color: pizza ? Colors.white : Colors.black, height: 50, width: 50, fit: BoxFit.cover),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: salad ? Colors.black : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/salad.png', color: salad ? Colors.white : Colors.black, height: 50, width: 50, fit: BoxFit.cover),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: burger ? Colors.black : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/burger.png', color: burger ? Colors.white : Colors.black, height: 50, width: 50, fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
