import 'dart:convert';

class CitiesModel {
  List<CityData>? data;

  CitiesModel({
    this.data,
  });

  factory CitiesModel.fromRawJson(String str) => CitiesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    data: json["data"] == null ? [] : List<CityData>.from(json["data"]!.map((x) => CityData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CityData {
  String? id;
  String? name;
  String? state;
  String? country;
  Coord? coord;

  CityData({
    this.id,
    this.name,
    this.state,
    this.country,
    this.coord,
  });

  factory CityData.fromRawJson(String str) => CityData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    id: json["id"].toString(),
    name: json["name"],
    state: json["state"],
    country: json["country"],
    coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state": state,
    "country": country,
    "coord": coord?.toJson(),
  };
}

class Coord {
  double? lon;
  double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}
