import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import './home_screen.dart';
import './bookings.dart';
import './profile.dart';

class HomePageNav extends StatefulWidget {
  // const HomePageNav({Key? key}) : super(key: key);

  @override
  State<HomePageNav> createState() => _HomePageNavState();
}

class _HomePageNavState extends State<HomePageNav> {
  int _selectedIndex = 0;
  List pages = [HomePage(), BookingsPage(), Profile()];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9fa),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTap,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "home")
          // BottomNavigationBarItem(icon: Icon(Icons.person),
          //     label: "home"

          // )
        ],
      ),
    );
  }
}
