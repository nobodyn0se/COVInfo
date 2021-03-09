class GlobalResponse {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int affectedCountries;
  final DateTime updated;
  final DateTime lastUpdate; 

  GlobalResponse(
      {this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.affectedCountries,
      this.updated, 
      this.lastUpdate});

  factory GlobalResponse.fromJson(Map<String, dynamic> json) {
    final toDateTime = DateTime.fromMillisecondsSinceEpoch(json['updated']);
    
    return GlobalResponse(
      lastUpdate: DateTime.now(), 
      updated: toDateTime,
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      affectedCountries: json['affectedCountries'],
    );
  }

  Map<String, dynamic> toJson() => {
        "cases": cases,
        "deaths": deaths,
        "recovered": recovered,
        "active": active,
        "affectedCountries": affectedCountries,
      };
}

class CountriesResponse {
  final String country;
  final String flagURL; //nested json
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int tests;
  final int cpom;
  final int dpom;
  final int rpom;
  final int tpom;

  CountriesResponse(
      {this.country,
      this.flagURL,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.tests,
      this.cpom,
      this.dpom,
      this.rpom,
      this.tpom});

  factory CountriesResponse.fromJson(Map<String, dynamic> json) {
    return CountriesResponse(
        country: json['country'],
        flagURL: json['countryInfo']['flag'], //nested URL
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        todayRecovered: json['todayRecovered'],
        active: json['active'],
        critical: json['critical'],
        tests: json['tests'],
        cpom: json['casesPerOneMillion'].truncate(),
        dpom: json['deathsPerOneMillion'].truncate(),
        rpom: json['recovered'].truncate());
  }
}

class VaccineDataResponse {
  final List<String> dates;
  final List<int> doses;
  final List<int> perDay;

  VaccineDataResponse({this.dates, this.doses, this.perDay});

  factory VaccineDataResponse.fromJson(Map<String, dynamic> json) {
    Map<String, int> timeMap =
        Map.from(json["timeline"]).map((k, v) => MapEntry<String, int>(k, v));

    List<String> cdates = timeMap.keys.toList();
    List<int> cdoses = timeMap.values.toList();
    List<int> daily = [];

    for (int i = 0; i < cdoses.length - 1; ++i) {
      daily.add(cdoses[i + 1] - cdoses[i]); //one less than dates' list
    }
    daily = daily.sublist(0, daily.length - 1);
    //print("Daily: ${daily.length}");
    cdates = cdates.sublist(1, cdates.length - 1); //keep equal length
    return VaccineDataResponse(dates: cdates, doses: cdoses, perDay: daily);
  }
}

class TestingData {
  final int totalRows;
  final List<TestRows> rows;
  final List<int> dailytests;

  TestingData({this.totalRows, this.rows, this.dailytests});

  factory TestingData.fromJson(Map<String, dynamic> json) {
    List<TestRows> passList =
        List<TestRows>.from(json["rows"].map((e) => TestRows.fromJson(e)));
    passList = passList.sublist(passList.length - 30, passList.length);

    List<int> tests = [];
    for (int i = 0; i < passList.length - 2; ++i) {
      tests.add(passList[i + 1].value.samples - passList[i].value.samples);
    }
    //return 29 days of data
    return TestingData(
      totalRows: json["total_rows"],
      rows: passList,
      dailytests: tests,
    );
  }
}

class TestRows {
  final Val value;

  TestRows({this.value});

  factory TestRows.fromJson(Map<String, dynamic> json) {
    return TestRows(value: Val.fromJson(json["value"]));
  }
}

class Val {
  final int samples;

  Val({this.samples});

  factory Val.fromJson(Map<String, dynamic> json) {
    return Val(samples: json["samples"]);
  }
}
