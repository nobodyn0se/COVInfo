import 'package:ncov_visual/provider/coreClass.dart';

import './data.dart';
import 'package:flutter/cupertino.dart';

class GlobalResponseHelper extends ChangeNotifier {
  List<dynamic> obj = List<dynamic>();
  GlobalResponse globalData = GlobalResponse();

  List<CountriesResponse> topRec = List<CountriesResponse>();
  List<CountriesResponse> topDed = List<CountriesResponse>();
  List<CountriesResponse> topCas = List<CountriesResponse>();
  List<CountriesResponse> topAct = List<CountriesResponse>();

  List<CountriesResponse> hDeaths = List<CountriesResponse>();
  List<CountriesResponse> hCases = List<CountriesResponse>();
  List<CountriesResponse> hRecover = List<CountriesResponse>();

  bool bufferStatus = true;

  getDataGlobal(context) async {
    bufferStatus = true;
    obj = await fetchDataGlobal(context);

    this.globalData = obj[0];

    topRec = List.from(obj[1]); //sort max recoveries
    topRec.sort((a, b) => b.todayRecovered.compareTo(a.todayRecovered));
    this.topRec = topRec.sublist(0, 5);

    topCas = List.from(obj[1]);
    this.topCas = topCas.sublist(0, 5); //already sorted by top 24h cases

    topDed = List.from(obj[1]); //sort max deaths
    topDed.sort((a, b) => b.todayDeaths.compareTo(a.todayDeaths));
    this.topDed = topDed.sublist(0, 5);

    topAct = List.from(obj[1]);
    topAct.sort((a, b) => b.active.compareTo(a.active));
    this.topAct = topAct.sublist(0, 5);

    hDeaths = List.from(obj[1]);
    hDeaths.sort((a, b) => b.deaths.compareTo(a.deaths));
    this.hDeaths = hDeaths.sublist(0, 5);

    hCases = List.from(obj[1]);
    hCases.sort((a, b) => b.cases.compareTo(a.cases));
    this.hCases = hCases.sublist(0, 5);

    hRecover = List.from(obj[1]);
    hRecover.sort((a, b) => b.recovered.compareTo(a.recovered));
    this.hRecover = hRecover.sublist(0, 5); 

    bufferStatus = false;
    obj.clear();

    notifyListeners();
  }
}

class CountriesResponseHelper extends ChangeNotifier {
  List<CountriesResponse> countriesList =
      List<CountriesResponse>(); //instantiation is important here
  bool bufferStatus = true;

  getDataCountries(context) async {
    bufferStatus = true;
    countriesList = await fetchDataCountries(context);
    bufferStatus = false;

    notifyListeners();
  }
}
