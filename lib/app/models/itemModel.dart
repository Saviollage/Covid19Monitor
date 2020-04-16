class Item {
  String city;
  String cityIbgeCode;
  int confirmed;
  double confirmedPer100kInhabitants;
  String date;
  double deathRate;
  int deaths;
  int estimatedPopulation2019;
  bool isLast;
  int orderForPlace;
  String placeType;
  String state;

  Item(
      {this.city,
      this.cityIbgeCode,
      this.confirmed,
      this.confirmedPer100kInhabitants,
      this.date,
      this.deathRate,
      this.deaths,
      this.estimatedPopulation2019,
      this.isLast,
      this.orderForPlace,
      this.placeType,
      this.state});

  Item.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityIbgeCode = json['city_ibge_code'];
    confirmed = json['confirmed'] == null ? 0 : json['confirmed'];
    confirmedPer100kInhabitants = json['confirmed_per_100k_inhabitants'];
    date = json['date'];
    deathRate = json['death_rate'];
    deaths = json['deaths'] == null ? 0 : json['deaths'];
    estimatedPopulation2019 = json['estimated_population_2019'];
    isLast = json['is_last'];
    orderForPlace = json['order_for_place'];
    placeType = json['place_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['city_ibge_code'] = this.cityIbgeCode;
    data['confirmed'] = this.confirmed;
    data['confirmed_per_100k_inhabitants'] = this.confirmedPer100kInhabitants;
    data['date'] = this.date;
    data['death_rate'] = this.deathRate;
    data['deaths'] = this.deaths;
    data['estimated_population_2019'] = this.estimatedPopulation2019;
    data['is_last'] = this.isLast;
    data['order_for_place'] = this.orderForPlace;
    data['place_type'] = this.placeType;
    data['state'] = this.state;
    return data;
  }
}
