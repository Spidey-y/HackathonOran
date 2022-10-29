import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/notif/notifications.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

AppBar nav(context, String x, GlobalKey<ScaffoldState> key) => AppBar(
      leading: InkWell(
        onTap: () {
          key.currentState!.openDrawer();
        },
        child: const Icon(
          CupertinoIcons.square_grid_2x2,
          size: 30,
          color: Color.fromARGB(255, 3, 21, 33),
        ),
      ),
      backgroundColor: const Color(0xfff2f2f2),
      elevation: 0,
      shadowColor: null,
      centerTitle: true,
      title: AutoSizeText(
        x,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 3, 21, 33), fontWeight: FontWeight.bold),
      ),
      actions: [
        InkWell(
          onTap: () {
            pushNewScreen(context,
                screen: const NotificationPage(), withNavBar: false);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              CupertinoIcons.bell,
              size: 30,
              color: Color.fromARGB(255, 3, 21, 33),
            ),
          ),
        )
      ],
    );
