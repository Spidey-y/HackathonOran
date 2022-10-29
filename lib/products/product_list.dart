import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hackathon/Theme/buttons.dart';
import 'package:hackathon/Theme/headers.dart';
import 'package:hackathon/products/statistics.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../report/report.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const drwr(),
      appBar: nav(context, "MY PRODUCTS", _scaffoldKey),
      backgroundColor: const Color(0xfff2f2f2),
      body: Column(
        children: [
          topButton(context),
          Expanded(
            child: ListView(
              children: [
                card(
                    context,
                    "Water Bottle",
                    "https://cdn3.iconfinder.com/data/icons/food-emoji/50/PlasticWaterBottle-512.png",
                    "2022-12-05",
                    "5"),
                card(
                    context,
                    "Bread",
                    "https://sallysbakingaddiction.com/wp-content/uploads/2019/11/homemade-sandwich-bread.jpg",
                    "2022-06-05",
                    "10"),
                card(
                    context,
                    "Milk",
                    "https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg",
                    "2022-10-29",
                    "1"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  topButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    const Icon(
                      Icons.camera_enhance_outlined,
                      color: Colors.grey,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "SCAN YOUR PRODUCT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff164A70),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Take a picture of your product and its expiry date.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    color: Colors.grey.shade200,
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ],
                              color: const Color(0xff2E6503),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: AutoSizeText(
                            "Confirm",
                            minFontSize: 18,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ))),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(1, 1),
                                    color: Colors.grey.shade200,
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: AutoSizeText(
                            "Cancel",
                            minFontSize: 18,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                                color: Color(0xff2E6503),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ))),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            // color: Colors.white,
            border: Border.all(
              color: const Color(0xff2E6503),
            ),
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: const Center(
          child: AutoSizeText(
            "ADD PRODUCT",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  card(BuildContext context, x, z, y, k) {
    return InkWell(
      onTap: () {
        pushNewScreen(context, screen: const Stats(), withNavBar: false);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
              color: DateTime.parse(y).difference(DateTime.now()).inDays < 3 &&
                      DateTime.parse(y).difference(DateTime.now()).inDays >= 0
                  ? Colors.orange
                  : DateTime.now().isAfter(DateTime.parse(y))
                      ? Colors.red
                      : Colors.white,
              width: 2),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 3),
              // spreadRadius: 6
            )
          ],
        ),
        child: Center(
            child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 10, 5),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(z), fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  x,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  "Time to expire: $y",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                AutoSizeText(
                  "Quantity: $k",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }
}
