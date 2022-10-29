import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_sharp,
              size: 40,
              color: Colors.black,
            )),
        backgroundColor: const Color(0xfff2f2f2),
        elevation: 0,
        shadowColor: null,
        title: const AutoSizeText(
          "STATISTICS",
          style: TextStyle(
              color: Color.fromARGB(255, 3, 21, 33),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xfff2f2f2)),
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                      child: Text(
                    "Consume",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff164A70)),
                  )),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff164A70),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "BREAD",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff164A70),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/icons/graph1.svg",
            width: MediaQuery.of(context).size.width * 0.98,
          ),
          SvgPicture.asset(
            "assets/icons/graph2.svg",
            width: MediaQuery.of(context).size.width * 0.98,
          ),
        ],
      ),
    );
  }
}
