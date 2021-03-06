import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ncov_visual/provider/apiHelper.dart';
import 'package:ncov_visual/pages/mainpage.dart';
import 'package:ncov_visual/pages/countriespage.dart';
import 'package:ncov_visual/pages/indiapage.dart';
import 'package:ncov_visual/screen_size.dart';
import 'package:provider/provider.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  bool asdad = false; 
  GlobalResponseHelper provGlo;
  CountriesResponseHelper provCount;

  final List<Map<String, dynamic>> _tabs = [
    {
      'page': CountriesPage(),
      'icon_color': Colors.orange[100],
      'bgcolor': Colors.orange[700],
      'title': 'List of Countries'
    },
    {
      'page': MainPage(),
      'icon_color': Colors.lightBlue[200],
      'bgcolor': Colors.lightBlue[900],
      'title': 'Worldwide Statistics'
    },
    {
      'page': IndiaPage(),
      'icon_color': Colors.green[100],
      'bgcolor': Colors.green[700],
      'title': 'India (Detailed)'
    },
  ];

  int initIndex = 1; //Center Page - Worldwide displayed initially

  void _onTabChanged(int index) {
    setState(() {
      initIndex = index;
    });
  }

  @override
  void initState() {
    print("Init State initialized\n");
    asdad = true;
    //.then((_) => prov.fetchDataCountries());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (asdad) {
      ScreenSize().init(context);
      provGlo = Provider.of<GlobalResponseHelper>(context, listen: false);
      provCount = Provider.of<CountriesResponseHelper>(context, listen: false);

      Future.delayed(Duration.zero, () {
        provGlo.getDataGlobal(context);
      }).then((_) => provCount.getDataCountries(context));
      asdad = !asdad;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[initIndex]['title']),
        backgroundColor: _tabs[initIndex]['bgcolor'],
      ),
      body: IndexedStack(
        index: initIndex,
        children: [
          ..._tabs.map((e) => e['page']).toList()
        ], //retain state and create list of widgets
      ),
      //_tabs[initIndex]['page'],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<GlobalResponseHelper>(context, listen: false)
              .getDataGlobal(context);
          Provider.of<CountriesResponseHelper>(context, listen: false)
              .getDataCountries(context);
        }, //onPressed needs a void, prov returns a Future
        backgroundColor: Colors.green[700],
        child: Icon(Icons.refresh),
        elevation: ScreenSize.safeWidth * 2,
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniEndFloat,

      bottomNavigationBar: CurvedNavigationBar(
        color: _tabs[initIndex]['bgcolor'],
        backgroundColor: Colors.grey[50], //Scaffold color
        buttonBackgroundColor: _tabs[initIndex]['bgcolor'],
        height: ScreenSize.blockHeight * 7, //8%
        index: initIndex, //sets the initial index for BottomNavigationBar
        onTap: (int index) {
          //changes both BNB index and PageIndex referenced from <List> _screen
          _onTabChanged(index);
        },
        items: [
          Icon(
            Icons.list,
            size: ScreenSize.safeHeight * 4,
            color: _tabs[initIndex]['icon_color'],
          ),
          Icon(
            Icons.trending_up,
            size: ScreenSize.safeHeight * 4,
            color: _tabs[initIndex]['icon_color'],
          ),
          Icon(
            Icons.location_on,
            size: ScreenSize.safeHeight * 4,
            color: _tabs[initIndex]['icon_color'],
          ),
        ],
        animationDuration: Duration(milliseconds: 100),
        animationCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
