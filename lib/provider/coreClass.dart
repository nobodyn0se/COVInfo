class GlobalResponse {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int affectedCountries;

  GlobalResponse(
      {this.cases,
      this.deaths,
      this.recovered,
      this.active,
      this.affectedCountries});

  factory GlobalResponse.fromJson(Map<String, dynamic> json) {
    return GlobalResponse(
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
