import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/widget/widget-support.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int quantity;
  int time = 30;
  late int price;
  late int total;

  @override
  void initState() {
    quantity = 0;
    price = 5;
    total = 0;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  )),
              Center(
                child: Image.asset(
                  'images/salad2.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Salad Organic Eatclean',
                    style: AppWidget.head2LineTextFieldStyle(),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 0) {
                            quantity--;
                          }
                          total = price * quantity;
                          setState(() {});
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            // height: 20,
                            // width: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(quantity.toString(), style: AppWidget.boldTextFieldStyle()),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          quantity++;
                          total = price * quantity;

                          setState(() {});
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            // height: 20,
                            // width: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text('\$ $price', style: AppWidget.head2LineTextFieldStyle()),
              const SizedBox(height: 20),
              Text(
                'Xà lách hữu cơ, ngô mì, cà chua, dứa, sốt Eatclean và trứng Orannic',
                style: AppWidget.LightTextFieldStyle(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('Delivery Time', style: AppWidget.boldTextFieldStyle()),
                  const SizedBox(width: 10),
                  const Icon(Icons.timer_outlined),
                  Text(time.toString(), style: AppWidget.boldTextFieldStyle()),
                ],
              ),
              const Spacer(),
              const Divider(color: Colors.black38, height: 1.0),
              Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: AppWidget.head2LineTextFieldStyle(),
                        ),
                        Text(
                          ' \$ ${total.toString()}',
                          style: AppWidget.headLineTextFieldStyle(),
                        ),
                      ],
                    ),
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: MediaQuery.of(context).size.width / 6,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Add To Cart',
                              style: AppWidget.lightWhiteTextFieldStyle(),
                            ),
                            const Icon(Icons.shopping_cart, color: Colors.white),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
