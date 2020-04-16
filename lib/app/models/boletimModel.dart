class Boletim {
  String date;
  String notes;
  String state;
  String url;

  Boletim({this.date, this.notes, this.state, this.url});

  Boletim.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    notes = json['notes'];
    state = json['state'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['notes'] = this.notes;
    data['state'] = this.state;
    data['url'] = this.url;
    return data;
  }
}