import './data.dart';
import 'package:flutter/cupertino.dart';
import 'package:ncov_visual/provider/coreClass.dart';

class GlobalResponseHelper extends ChangeNotifier {
  GlobalResponse obj = GlobalResponse();

  bool bufferStatus = true;

  getDataGlobal(context) async {
    bufferStatus = true;
    obj = await fetchDataGlobal(context);
    bufferStatus = false;

    notifyListeners();
  }
}

class CountriesResponseHelper extends ChangeNotifier {
  List<CountriesResponse> obj = List<CountriesResponse>();
  bool bufferStatus = true;

  getDataCountries(context) async {
    bufferStatus = true;
    obj = await fetchDataCountries(context);
    bufferStatus = false;

    notifyListeners(); 
  }
}
