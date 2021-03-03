import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ncov_visual/provider/coreClass.dart';

Future<GlobalResponse> fetchDataGlobal(context) async {
  GlobalResponse resGlobal; //placeholder for initial fetch

  const url1 = 'https://disease.sh/v3/covid-19/all';

  try {
    final resp = await http.get(url1);

    if (resp.statusCode == 200) {
      final dec = json.decode(resp.body);
      print("API Call made");
      resGlobal = GlobalResponse.fromJson(dec);
    }
  } catch (er) {
    log(er);
  }
  return resGlobal;
}

Future<List<CountriesResponse>> fetchDataCountries(context) async {
  List<CountriesResponse> crlist = [];
  const url2 = 'https://disease.sh/v3/covid-19/countries';

  try {
    final resp = await http.get(url2);

    if (resp.statusCode == 200) {
      final cdec = json.decode(resp.body);
      print("2nd API Call made");
      for (var id in cdec) {
        crlist.add(CountriesResponse.fromJson(id));
      }
    } else {
      return List<CountriesResponse>();
    }
  } catch (err) {
    log(err);
  }
  crlist.sort((v1, v2) => v2.cases.compareTo(v1.cases)); //v2 followed by v1 for descending
  // crlist.sort((tc1, tc2) => tc2.todayCases.compareTo(tc1.todayCases)); 
  // List<dynamic> newlist = crlist.sublist(0, 5); 
  // print(newlist);
  return crlist;
}
