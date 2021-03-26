import 'package:ncov_visual/provider/coreClass.dart';
import './data.dart';
import 'package:flutter/cupertino.dart';

class GlobalResponseHelper extends ChangeNotifier {
  List<dynamic> obj = [];
  GlobalResponse globalData = GlobalResponse();

  List<CountriesResponse> topRec = [];
  List<CountriesResponse> topDed = [];
  List<CountriesResponse> topCas = [];
  List<CountriesResponse> topAct = [];

  List<CountriesResponse> hDeaths = [];
  List<CountriesResponse> hCases = [];
  List<CountriesResponse> hRecover = [];
  List<CountriesResponse> hTests = [];

  List<TopVaccineList> topVaccList = [];
  List<Map<String, dynamic>> newVaccList = [];
  List<TopVaccineList> dailyVaccList = [];

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

    hTests = List.from(obj[1]);
    hTests.sort((a, b) => b.tests.compareTo(a.tests));
    this.hTests = hTests.sublist(0, 5);

    topVaccList = List.from(obj[2]);

    topVaccList.sort((a, b) => b.timeline.values
        .elementAt(2)
        .compareTo(a.timeline.values.elementAt(2)));
    topVaccList = topVaccList.sublist(0, 5);

    dailyVaccList = List.from(obj[2]);
    dailyVaccList.sort((k1, k2) => (k2.timeline.values.elementAt(1) -
            k2.timeline.values.first)
        .compareTo(k1.timeline.values.elementAt(1) - k1.timeline.values.first));
    dailyVaccList = dailyVaccList.sublist(0, 5);

    dailyVaccList.forEach((element) {
      element.timeline["dailyPace"] =
          element.timeline.values.elementAt(1) - element.timeline.values.first;
    });

    bufferStatus = false;

    obj = null;

    notifyListeners();
  }
}

class CountriesResponseHelper extends ChangeNotifier {
  VaccineDataResponse vaccData = VaccineDataResponse();
  List<dynamic> recObj = [];
  List<CountriesResponse> countriesList = []; //removed deprecated instantiation

  TestingData testObj = TestingData();
  bool bufferStatus = true;

  getDataCountries(context) async {
    bufferStatus = true;
    recObj = await fetchDataCountries(context);
    countriesList = List.from(recObj[0]);
    vaccData = recObj[1]; //gets map from the list
    testObj = recObj[2];
    bufferStatus = false;

    recObj = null;
    notifyListeners();
  }
}

//three async calls cause stack overflow
