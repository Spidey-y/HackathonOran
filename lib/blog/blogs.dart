import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Theme/headers.dart';
import 'package:hackathon/blog/add_post.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:readmore/readmore.dart';

import '../report/report.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key});

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const drwr(),
      appBar: nav(context, "HOME", _scaffoldKey),
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              welcome(context),
              const SizedBox(
                height: 15,
              ),
              card(
                  context,
                  "https://cdn-icons-png.flaticon.com/512/168/168882.png",
                  "https://hesebike.com/echo.png",
                  "Adel Hammouche",
                  "2022/12/05, 20:08",
                  "Carrier bags. I have had a Conran carrier bag with a picture of a cat on both sides and I’ve used it on every shopping trip for the last ten years at least."),
              card(
                  context,
                  "https://cdn-icons-png.flaticon.com/512/194/194938.png",
                  "https://hesebike.com/echo.png",
                  "Test name",
                  "2022/08/23, 7:33",
                  "What could have been better than this out of nowhere ?? Each and every part of the bike being used in the best possible way it could have. Best example of reuse that I have seen so far."),
              card(
                  context,
                  "https://cdn-icons-png.flaticon.com/512/147/147133.png",
                  "https://hesebike.com/echo.png",
                  "Name test",
                  "2022/06/07, 17:51",
                  "I reuse plastic bottles, spoons, glass jars and even bottle caps. I take the inspiration from my grandfather who always used to advise me to reduce waste and recycle whatever’s possible."),
            ],
          ))
        ],
      ),
    );
  }

  Row welcome(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: MediaQuery.of(context).size.width * 0.5,
                child: const AutoSizeText(
                  "Good morning, adel",
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 3),
                // spreadRadius: 6
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: PopupMenuButton<int>(
              // Callback that sets the selected popup menu item.
              onSelected: (int item) {
                switch (item) {
                  case 0:
                    pushNewScreen(context,
                        screen: const AddPost(), withNavBar: false);
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Add post'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('Item 2'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text('Item 3'),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text('Item 4'),
                    ),
                    const PopupMenuItem<int>(
                      value: 4,
                      child: Text('Item 4'),
                    ),
                  ]),
        )
      ],
    );
  }

  Container card(BuildContext context, u, x, y, z, k) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 3),
            // spreadRadius: 6
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(image: NetworkImage(u))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    y,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    z,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ReadMoreText(
              k,
              trimLines: 2,
              style: const TextStyle(fontSize: 12),
              colorClickableText: Colors.black,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              lessStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              moreStyle:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(image: NetworkImage(x))),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 15, 5),
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 230, 229, 229)),
                child: Row(mainAxisSize: MainAxisSize.min, children: const [
                  Icon(
                    Icons.arrow_circle_up,
                    color: Colors.grey,
                  ),
                  AutoSizeText(
                    "10",
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 230, 229, 229)),
                child: Row(mainAxisSize: MainAxisSize.min, children: const [
                  Icon(
                    Icons.arrow_circle_down,
                    color: Colors.grey,
                  ),
                  AutoSizeText(
                    "5",
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
