import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ncov_visual/provider/coreClass.dart';

Future<List<dynamic>> fetchDataGlobal(context) async {
  GlobalResponse resGlobal; //placeholder for initial fetch
  List<CountriesResponse> cmap = [];

  const _url1 = 'https://disease.sh/v3/covid-19/all';
  const _url2 = 'https://disease.sh/v3/covid-19/countries?sort=todayCases';

  try {
    final resp = await Future.wait([http.get(_url1), http.get(_url2)]);

    if (resp[0].statusCode == 200 && resp[1].statusCode == 200) {
      print("API Call made");
      final dec = json.decode(resp[0].body);
      final topCasesList = json.decode(resp[1].body);

      resGlobal = GlobalResponse.fromJson(dec);

      for (var _ in topCasesList) cmap.add(CountriesResponse.fromJson(_));

      topCasesList.clear(); //clear list
      dec.clear();
    }
  } catch (er) {
    log(er);
  }
  return [resGlobal, cmap];
}

Future<List<dynamic>> fetchDataCountries(context) async {
  List<CountriesResponse> crlist = [];
  VaccineDataResponse vaccineVar;
  const url2 = 'https://disease.sh/v3/covid-19/countries?sort=cases';
  const _url4 =
      'https://disease.sh/v3/covid-19/vaccine/coverage/countries/india?lastdays=30';

  try {
    final resp = await Future.wait([http.get(url2), http.get(_url4)]);

    if (resp[0].statusCode == 200 && resp[1].statusCode == 200) {
      final cdec = json.decode(resp[0].body);
      final idec = json.decode(resp[1].body);
      print("2nd API Call made");
      vaccineVar = VaccineDataResponse.fromJson(idec);
      for (var id in cdec) {
        crlist.add(CountriesResponse.fromJson(id));
      }
    }
  } catch (err) {
    log(err);
  }
  return [crlist, vaccineVar];
}