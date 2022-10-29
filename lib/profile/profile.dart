import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/Theme/headers.dart';

import '../report/report.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const drwr(),
      backgroundColor: const Color(0xfff2f2f2),
      appBar: nav(context, "PROFILE", _scaffoldKey),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.32,
                          height: MediaQuery.of(context).size.width * 0.32,
                          decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Colors.white),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/512/147/147144.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.36,
                          height: MediaQuery.of(context).size.width * 0.36,
                          // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.orange),
                            strokeWidth: 8,
                            value: 0.7,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "LvL 30!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 1,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.2)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Joined",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 22),
                      ),
                      Text(
                        "6 mon ago.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 5, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Adel",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 15, 38)),
                ),
                Text(
                  "HAMMOUCHE",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 6, 15, 38)),
                ),
                Text(
                  "a.hammouche@esi-sba.dz",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 6, 15, 38)),
                ),
              ],
            ),
          ),
          stat("assets/icons/check.svg", "Approved reports", "7"),
          stat("assets/icons/youtube.svg", "test", "5"),
          stat("assets/icons/youtube.svg", "Blogs", "6"),
          Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 3),
                        // spreadRadius: 6
                      )
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign out",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row stat(x, y, z) {
    return Row(
      children: [
        const SizedBox(
          width: 40,
        ),
        SvgPicture.asset(
          x,
          width: 70,
        ),
        Container(
          height: 60,
          width: 1,
          margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              y,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2E6503)),
            ),
            const Text(
              "12",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 7, 15, 44)),
            ),
          ],
        )
      ],
    );
  }
}
