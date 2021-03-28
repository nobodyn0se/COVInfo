import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ncov_visual/provider/coreClass.dart';

Future<List<dynamic>> fetchDataGlobal(context) async {
  GlobalResponse? resGlobal; //placeholder for initial fetch
  List<CountriesResponse> cmap = [];
  List<TopVaccineList>? vcList;

  final _url1 = Uri.parse('https://disease.sh/v3/covid-19/all');
  final _url2 = Uri.parse('https://disease.sh/v3/covid-19/countries?sort=todayCases');
  final _url3 =
      Uri.parse('https://disease.sh/v3/covid-19/vaccine/coverage/countries?lastdays=3');
  //countries vaccine data

  try {
    final resp =
        await Future.wait([http.get(_url1), http.get(_url2), http.get(_url3)]);

    if (resp[0].statusCode == 200 &&
        resp[1].statusCode == 200 &&
        resp[2].statusCode == 200) {
      print("API Call made");
      final dec = json.decode(resp[0].body);
      final topCasesList = json.decode(resp[1].body);

      vcList = listFromJson(resp[2].body);

      resGlobal = GlobalResponse.fromJson(dec);

      for (var _ in topCasesList) cmap.add(CountriesResponse.fromJson(_));

      topCasesList.clear(); //clear list
      dec.clear();
    }
  } catch (er) {
    log(er.toString());
  }
  return [resGlobal, cmap, vcList];
}

Future<List<dynamic>> fetchDataCountries(context) async {
  List<CountriesResponse> crlist = [];
  VaccineDataResponse? vaccineVar;
  TestingData? testVar;

  final _url2 = Uri.parse('https://disease.sh/v3/covid-19/countries?sort=cases');
  final _url4 =
      Uri.parse('https://disease.sh/v3/covid-19/vaccine/coverage/countries/india?lastdays=30');
  final _url5 =
      Uri.parse('https://raw.githubusercontent.com/datameet/covid19/master/data/icmr_testing_status.json'); //testing data

  try {
    final resp =
        await Future.wait([http.get(_url2), http.get(_url4), http.get(_url5)]);

    if (resp[0].statusCode == 200 &&
        resp[1].statusCode == 200 &&
        resp[2].statusCode == 200) {
      final cdec = json.decode(resp[0].body);
      final idec = json.decode(resp[1].body);
      final tdec = json.decode(resp[2].body);
      // print(json.decode(resp[2].body).runtimeType); Map<String, dynamic>
      print("2nd API Call made");
      vaccineVar = VaccineDataResponse.fromJson(idec);

      for (var id in cdec) {
        crlist.add(CountriesResponse.fromJson(id));
      }

      testVar = TestingData.fromJson(tdec);
    } //if block

  } catch (err) {
    log(err.toString());
  }
  return [crlist, vaccineVar, testVar];
}

List<TopVaccineList> listFromJson(String str) => List<TopVaccineList>.from(
    json.decode(str).map((i) => TopVaccineList.fromJson(i)));
