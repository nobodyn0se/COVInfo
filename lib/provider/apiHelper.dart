import './data.dart';
import 'package:flutter/cupertino.dart';
import 'package:ncov_visual/provider/coreClass.dart';

class GlobalResponseHelper extends ChangeNotifier {
  dynamic obj; 
  bool bufferStatus = true;

  getDataGlobal(context) async {
    bufferStatus = true;
    obj = await fetchDataGlobal(context);
    bufferStatus = false;

    notifyListeners();
  }
}

class CountriesResponseHelper extends ChangeNotifier {
  List<dynamic> obj = List<dynamic>();
  bool bufferStatus = true;

  getDataCountries(context) async {
    bufferStatus = true;
    obj = await fetchDataCountries(context); //list of objects[0, 1]
    bufferStatus = false;

    notifyListeners();
  }
}
