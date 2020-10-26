import 'package:flutter/material.dart';
import 'package:ncov_visual/screens/initpage.dart';
import 'package:provider/provider.dart';
import './screens/mainpage.dart';
import './screens/indiapage.dart';
import './screens/countriespage.dart';
import './providers/data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => data_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/', //routing
        routes: {
          '/': (context) => InitPage(),
          MainPage.routeName: (context) => MainPage(),
          IndiaPage.routeName: (context) => IndiaPage(),
          CountriesPage.routeName: (context) => CountriesPage(),
        },
      ),
    );
  }
}
