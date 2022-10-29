import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Theme/headers.dart';
import '../icons2_icons.dart';
import '../report/report.dart';

class CharitiesPage extends StatefulWidget {
  const CharitiesPage({super.key});

  @override
  State<CharitiesPage> createState() => _CharitiesPageState();
}

class _CharitiesPageState extends State<CharitiesPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> isMore = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const drwr(),
        appBar: nav(context, "CHARITIES", _scaffoldKey),
        backgroundColor: const Color(0xFFF2F2F2),
        body: ListView(
          children: [
            card(
                0,
                "Adel Hammouche",
                "Alger, harrach",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam neque lectus, porta in lobortis vel, gravida quis augue. In vitae pellentesque ex, vitae gravida dui. Donec sed viverra augue. Curabitur non convallis metus. Vivamus imperdiet, velit ut mollis volutpat, purus felis placerat risus, quis pharetra ante nulla rhoncus neque. Cras sodales viverra iaculis. Suspendisse a fringilla elit. Vivamus suscipit urna vitae facilisis consectetur",
                ["Child", "meds"],
                "+213556115355",
                "fb",
                "aa",
                "a",
                "https://cdn-icons-png.flaticon.com/512/194/194938.png"),
            card(
              1,
              "Nour",
              "Chawalla",
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam neque lectus, porta in lobortis vel, gravida quis augue. In vitae pellentesque ex, vitae gravida dui. Donec sed viverra augue. Curabitur non convallis metus. Vivamus imperdiet, velit ut mollis volutpat, purus felis placerat risus, quis pharetra ante nulla rhoncus neque. Cras sodales viverra iaculis. Suspendisse a fringilla elit. Vivamus suscipit urna vitae facilisis consectetur",
              ["walo", "bzf", "test", "drhm"],
              "+213556115355",
              "fb",
              "aa",
              "a",
              "https://cdn-icons-png.flaticon.com/512/147/147133.png",
            ),
          ],
        ));
  }

  Container card(int ind, name, loc, bio, List<String> desc, phone, fb, insta,
      twitter, m) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            // spreadRadius: 6
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(m), fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    AutoSizeText(
                      loc,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: AutoSizeText(
            bio,
            maxLines: isMore[ind] ? 6 : 3,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        isMore[ind]
            ? Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: desc.map((e) => cateCard(e)).toList(),
              )
            : const SizedBox(),
        SizedBox(
          height: isMore[ind] ? 10 : 0,
        ),
        isMore[ind]
            ? Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          // ignore: deprecated_member_use
                          launch("tel:$phone");
                        },
                        child: AutoSizeText(
                          phone,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // ignore: deprecated_member_use
                        launch("$fb");
                      },
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: const Icon(
                            Icons2.facebook,
                            size: 20,
                            color: Color.fromARGB(255, 5, 63, 179),
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        // ignore: deprecated_member_use
                        launch("$insta");
                      },
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: const Icon(
                            Icons2.instagram,
                            color: Color.fromARGB(255, 230, 52, 91),
                            size: 20,
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        // ignore: deprecated_member_use
                        launch("$twitter");
                      },
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: const Icon(
                            Icons2.twitter,
                            size: 20,
                            color: Color.fromARGB(255, 55, 118, 244),
                          )),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: isMore[ind] ? 10 : 0,
        ),
        isMore[ind]
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMore[ind] = !isMore[ind];
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0xff2E6503), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: const AutoSizeText(
                            "Read less",
                            style: TextStyle(
                                color: Color(0xff2E6503),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff2E6503),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: const Center(
                            child: AutoSizeText(
                              "Donate!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isMore[ind] = !isMore[ind];
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2E6503),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        child: const AutoSizeText(
                          "Read more",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ]),
    );
  }

  Chip cateCard(String x) {
    return Chip(
      backgroundColor: Colors.yellow.withOpacity(0.25),
      elevation: 1,
      label: Text(
        x,
        style: TextStyle(color: Colors.black.withOpacity(0.7)),
      ),
    );
  }
}
