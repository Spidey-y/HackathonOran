import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hackathon/blog/blogs.dart';
import 'package:hackathon/charity/charity_page.dart';
import 'package:hackathon/icons2_icons.dart';
import 'package:hackathon/products/product_list.dart';
import 'package:hackathon/profile/profile.dart';
import 'package:hackathon/report/report.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -3),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.2))
        ],
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const BlogsPage(),
      const ProductsList(),
      const ReportPage(),
      const CharitiesPage(),
      const ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_2_square_stack),
        title: "POSTS",
        activeColorPrimary: const Color(0xff2E6503),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons2.graph),
        title: "PRODUCTS",
        activeColorPrimary: const Color(0xff2E6503),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons2.recycle,
          color: Colors.white,
        ),
        activeColorPrimary: const Color(0xff78B325),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons2.donate),
        title: "CHARITY",
        activeColorPrimary: const Color(0xff2E6503),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_fill),
        title: "PROFILE",
        activeColorPrimary: const Color(0xff2E6503),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
