import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../screens/mainpage.dart';
import '../screens/countriespage.dart';
import '../screens/indiapage.dart';
import '../util/screen_size.dart';
import '../util/colorslist.dart';

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
    ScreenSize().init(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: bgcolor[initIndex],
        backgroundColor: Colors.grey[50], //Scaffold color
        buttonBackgroundColor: bgcolor[initIndex],
        height: ScreenSize.blockHeight * 7, //8%
        index: initIndex, //sets the initial index for BottomNavigationBar
        onTap: (int index) {
          setState(() {
            //changes both BNB index and PageIndex referenced from <List> _screen
            initIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          Icon(Icons.list,
              size: ScreenSize.safeHeight * 4, color: colorlst[initIndex]),
          Icon(Icons.trending_up,
              size: ScreenSize.safeHeight * 4, color: colorlst[initIndex]),
          Icon(Icons.location_on,
              size: ScreenSize.safeHeight * 4, color: colorlst[initIndex])
        ],
        animationDuration: Duration(milliseconds: 100),
        animationCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
