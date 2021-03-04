import 'package:flutter/material.dart';
import 'pages/countriespage.dart';
import 'pages/indiapage.dart';
import 'pages/mainpage.dart';

class NavModel extends ChangeNotifier {
  int _currentTab = 1;
  List<Widget> _screen = [CountriesPage(), MainPage(), IndiaPage()];

  set currentTab(int tab) {
    _currentTab = tab;
    notifyListeners(); 
  }

  get currentTab => this._currentTab;
  get currentScreen => this._screen[this._currentTab];
}
