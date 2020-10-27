import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/all_data.dart';

class All_data_provider with ChangeNotifier {
  final String api_link = 'https://disease.sh/v3/covid-19/all';
  
  Future<all_data> fetchAllData() async {
    http.Response response = await http.get(api_link);

    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);

      print(body);
      return all_data.fromJson(body);
    } else {
      throw Exception('Failed to Load');
    }
  }
}
