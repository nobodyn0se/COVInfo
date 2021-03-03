import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ncov_visual/provider/coreClass.dart';

Future<dynamic> fetchDataGlobal(context) async {
  GlobalResponse resGlobal; //placeholder for initial fetch
  List<CountriesResponse> cmap = [], dmap = []; 

  const _url1 = 'https://disease.sh/v3/covid-19/all';
  const _url2 = 'https://disease.sh/v3/covid-19/countries?sort=todayCases';
  const _url3 = 'https://disease.sh/v3/covid-19/countries?sort=todayDeaths';

  try {
    final resp =
        await Future.wait([http.get(_url1), http.get(_url2), http.get(_url3)]);

    if (resp[0].statusCode == 200 && resp[1].statusCode == 200) {
      print("API Call made");
      final dec = json.decode(resp[0].body);
      final topCasesList = json.decode(resp[1].body);
      final topDeathsList = json.decode(resp[2].body);

      resGlobal = GlobalResponse.fromJson(dec);

      for (var _ in topCasesList) cmap.add(CountriesResponse.fromJson(_));
      dmap = cmap.sublist(0, 5);

      for (var id in topDeathsList) dmap.add(CountriesResponse.fromJson(id));
      dmap = dmap.sublist(0, 5);

      topDeathsList.clear();
      topCasesList.clear(); //clear list
      dec.clear();
    }
  } catch (er) {
    log(er);
  }
  return [resGlobal, cmap, dmap];
}

Future<List<dynamic>> fetchDataCountries(context) async {
  List<CountriesResponse> crlist = [];
  //List<CountriesResponse> tclist; //total cases list
  const url2 = 'https://disease.sh/v3/covid-19/countries?sort=cases';

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
  // crlist.sort((v1, v2) =>
  //     v2.cases.compareTo(v1.cases)); //v2 followed by v1 for descending
  // // tclist = crlist;
  // // tclist.sort((tc1, tc2) => tc2.todayCases.compareTo(tc1.todayCases));
  // // List<dynamic> newlist = tclist.sublist(0, 5);
  // // for (var id in newlist) print(id.toString());
  return crlist;
}
