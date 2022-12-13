class FavModel {
  String? sunrise;
  String? sunset;
  double? latitude;
  double? longitude;
  String? name;
  String? date;

  FavModel(
      {this.sunrise, this.sunset, this.longitude, this.latitude, this.name});
  FavModel.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise']?.toString();
    sunset = json['sunset']?.toString();
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['date'] = date;
    return data;
  }
}
