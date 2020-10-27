import 'package:flutter/foundation.dart';

class all_data {
  int cases;
  int deaths;
  int recovered;

  all_data({
    @required this.cases,
    @required this.deaths,
    @required this.recovered,
  });

  factory all_data.fromJson(Map<String, dynamic> json) {
    return all_data(
      cases: json['cases'] as int,
      deaths: json['deaths'] as int,
      recovered: json['recovered'] as int,
    );
  }
}
