import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ncov_visual/screens/mainpage.dart';
import 'package:ncov_visual/screens/countriespage.dart';
import 'package:ncov_visual/screens/indiapage.dart';

class InitPage extends StatefulWidget {
  InitPage({Key key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  PageController _pageController = PageController(
    initialPage: 1,
  );
  //PageView and BottomNavigationBar are independent hence require both
  //initialPage and index properties separately defined

  List<Widget> _screen = [CountriesPage(), MainPage(), IndiaPage()];

  int initIndex = 1; //Center Page - Worldwide displayed initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: initIndex, //sets the initial index for BottomNavigationBar
        onTap: (int index) {
          setState(() {
            //changes both BNB index and PageIndex referenced from <List> _screen
            initIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          Icon(Icons.list),
          Icon(Icons.trending_up),
          Icon(Icons.location_on)
        ],
      ),
    );
  }
}