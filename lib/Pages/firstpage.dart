import 'package:flutter/material.dart';
import 'package:movies_app/Screens/commingsoon.dart';
import 'package:movies_app/Screens/download.dart';
import 'package:movies_app/Screens/homescreen.dart';
import 'package:movies_app/Screens/more.dart';
import 'package:movies_app/Screens/search.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    More(),
    //Download(),
    //CommingSoon(),
    Search(),
    HomeScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_outlined,
              size: 22,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "المزيد",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.download_outlined,
          //     size: 22,
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.only(top: 8),
          //     child: Text(
          //       "التنزيلات",
          //       style: TextStyle(color: Colors.white, fontSize: 12),
          //     ),
          //   ),
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.movie_outlined,
          //     size: 22,
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.only(top: 8),
          //     child: Text(
          //       "قريبا",
          //       style: TextStyle(color: Colors.white, fontSize: 12),
          //     ),
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 22,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "البحث",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 22,
              color: Colors.white,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "الرئيسية",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
