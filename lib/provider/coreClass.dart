class GlobalResponse {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int affectedCountries;
  final int todayGCases;
  final int todayGDeaths;
  final int todayGRecovered;
  final String lastHour;
  final String lastMinute;

  GlobalResponse(
      {this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.affectedCountries,
      this.lastHour,
      this.lastMinute,
      this.todayGCases,
      this.todayGDeaths,
      this.todayGRecovered});

  factory GlobalResponse.fromJson(Map<String, dynamic> json) {
    final rightNow = DateTime.now();
    String hh, mm;
    if (rightNow.hour < 10) {
      hh = '0${rightNow.hour}';
    } else {
      hh = rightNow.hour.toString();
    }

    if (rightNow.minute < 10) {
      mm = '0${rightNow.minute}';
    } else {
      mm = rightNow.minute.toString();
    }

    return GlobalResponse(
      lastHour: hh,
      lastMinute: mm,
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      affectedCountries: json['affectedCountries'],
      todayGCases: json['todayCases'],
      todayGDeaths: json['todayDeaths'],
      todayGRecovered: json['todayRecovered'],
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
  final String eta;
  final DateTime eta20pct;

  VaccineDataResponse(
      {this.dates, this.doses, this.perDay, this.eta, this.eta20pct});

  factory VaccineDataResponse.fromJson(Map<String, dynamic> json) {
    Map<String, int> timeMap =
        Map.from(json["timeline"]).map((k, v) => MapEntry<String, int>(k, v));

    List<String> cdates = timeMap.keys.toList();
    List<int> cdoses = timeMap.values.toList(); //reduce
    List<int> daily = [];

    for (int i = 0; i < cdoses.length - 1; ++i) {
      daily.add(cdoses[i + 1] - cdoses[i]); //one less than dates' list
    }

    daily = daily.sublist(0, daily.length);
    cdates = cdates.sublist(1, cdates.length); //keep equal length

    int sum = 0;
    final don = cdoses[cdoses.length - 1] * 0.000001;
    double avg;
    for (int i = daily.length - 7; i < daily.length; ++i) {
      sum += daily[i];
    }
    avg = sum / 7 * 0.000001; //7 day rolling avg
    final etaVal = (((1400 - don) / avg) / 365).toStringAsFixed(2);

    final days20 = (280 - don) ~/ avg; //efficient toInt()

    final eta20 = DateTime.now().add(Duration(days: days20));
    //ETA for 20% population coverage
    return VaccineDataResponse(
        dates: cdates,
        doses: cdoses,
        perDay: daily,
        eta: etaVal,
        eta20pct: eta20);
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
    for (int i = 0; i < passList.length - 1; ++i) {
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

  factory Val.fromJson(Map<String, dynamic> json) 
    => Val(samples: json["samples"]);
  
}

//Top 5 Vaccine List
class TopVaccineList {
  final String country;
  final Map<String, int> timeline;

  TopVaccineList({this.country, this.timeline});

  factory TopVaccineList.fromJson(Map<String, dynamic> json) {
    return TopVaccineList(
      country: json['country'],
      timeline:
          Map.from(json['timeline']).map((k, v) => MapEntry<String, int>(k, v)),
    );
  }
}
