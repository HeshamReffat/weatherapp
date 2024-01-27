import 'dart:convert';

class WeatherDataModel {
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  String? description;
  List<Days>? days;
  List<dynamic>? alerts;
  Map<String, StationValue>? stations;
  Days? currentConditions;

  WeatherDataModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
  });

  factory WeatherDataModel.fromRawJson(String str) => WeatherDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => WeatherDataModel(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"],
    description: json["description"],
    days: json["days"] == null ? [] : List<Days>.from(json["days"]!.map((x) => Days.fromJson(x))),
    alerts: json["alerts"] == null ? [] : List<dynamic>.from(json["alerts"]!.map((x) => x)),
    //stations: Map.from(json["stations"]).map((k, v) => MapEntry<String, StationValue>(k, StationValue.fromJson(v))),
    currentConditions: json["currentConditions"] == null ? null : Days.fromJson(json["currentConditions"]),
  );

  Map<String, dynamic> toJson() => {
    "queryCost": queryCost,
    "latitude": latitude,
    "longitude": longitude,
    "resolvedAddress": resolvedAddress,
    "address": address,
    "timezone": timezone,
    "tzoffset": tzoffset,
    "description": description,
    "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
    "alerts": alerts == null ? [] : List<dynamic>.from(alerts!.map((x) => x)),
    "stations": Map.from(stations!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "currentConditions": currentConditions?.toJson(),
  };
}

class Days {
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  List<Icon>? preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  String? conditions;
  Icon? icon;
  List<StationElement>? stations;
  Source? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  double? severerisk;
  String? description;
  List<Hours>? hours;

  Days({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory Days.fromRawJson(String str) => Days.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Days.fromJson(Map<String, dynamic> json) => Days(
    datetime: json["datetime"],
    datetimeEpoch: json["datetimeEpoch"],
    temp: json["temp"]?.toDouble(),
    feelslike: json["feelslike"]?.toDouble(),
    humidity: json["humidity"]?.toDouble(),
    dew: json["dew"]?.toDouble(),
    precip: json["precip"]?.toDouble(),
    precipprob: json["precipprob"]?.toDouble(),
    snow: json["snow"],
    snowdepth: json["snowdepth"],
    preciptype: json["preciptype"] == null ? [] : List<Icon>.from(json["preciptype"]!.map((x) => iconValues.map[x]!)),
    windgust: json["windgust"]?.toDouble(),
    windspeed: json["windspeed"]?.toDouble(),
    winddir: json["winddir"]?.toDouble(),
    pressure: json["pressure"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    cloudcover: json["cloudcover"]?.toDouble(),
    solarradiation: json["solarradiation"]?.toDouble(),
    solarenergy: json["solarenergy"]?.toDouble(),
    uvindex: json["uvindex"],
    conditions: json["conditions"].toString(),
    icon: iconValues.map[json["icon"]]!,
    //stations: json["stations"] == null ? [] : List<StationElement>.from(json["stations"].map((x) => stationElementValues.map[x])),
    source: sourceValues.map[json["source"]]!,
    sunrise: json["sunrise"],
    sunriseEpoch: json["sunriseEpoch"],
    sunset: json["sunset"],
    sunsetEpoch: json["sunsetEpoch"],
    moonphase: json["moonphase"]?.toDouble(),
    tempmax: json["tempmax"]?.toDouble(),
    tempmin: json["tempmin"]?.toDouble(),
    feelslikemax: json["feelslikemax"]?.toDouble(),
    feelslikemin: json["feelslikemin"]?.toDouble(),
    precipcover: json["precipcover"]?.toDouble(),
    severerisk: json["severerisk"],
    description: json["description"],
    hours: json["hours"] == null ? [] : List<Hours>.from(json["hours"]!.map((x) => Hours.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "datetimeEpoch": datetimeEpoch,
    "temp": temp,
    "feelslike": feelslike,
    "humidity": humidity,
    "dew": dew,
    "precip": precip,
    "precipprob": precipprob,
    "snow": snow,
    "snowdepth": snowdepth,
    "preciptype": preciptype == null ? [] : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
    "windgust": windgust,
    "windspeed": windspeed,
    "winddir": winddir,
    "pressure": pressure,
    "visibility": visibility,
    "cloudcover": cloudcover,
    "solarradiation": solarradiation,
    "solarenergy": solarenergy,
    "uvindex": uvindex,
    "conditions": conditionsValues.reverse[conditions],
    "icon": iconValues.reverse[icon],
    "stations": stations == null ? [] : List<dynamic>.from(stations!.map((x) => stationElementValues.reverse[x])),
    "source": sourceValues.reverse[source],
    "sunrise": sunrise,
    "sunriseEpoch": sunriseEpoch,
    "sunset": sunset,
    "sunsetEpoch": sunsetEpoch,
    "moonphase": moonphase,
    "tempmax": tempmax,
    "tempmin": tempmin,
    "feelslikemax": feelslikemax,
    "feelslikemin": feelslikemin,
    "precipcover": precipcover,
    "severerisk": severerisk,
    "description": description,
    "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x.toJson())),
  };
}

enum Conditions {
  CLEAR,
  OVERCAST,
  PARTIALLY_CLOUDY,
  RAIN_OVERCAST,
  RAIN_PARTIALLY_CLOUDY
}

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
  "Rain, Overcast": Conditions.RAIN_OVERCAST,
  "Rain, Partially cloudy": Conditions.RAIN_PARTIALLY_CLOUDY
});

enum Icon {
  CLEAR_DAY,
  CLEAR_NIGHT,
  CLOUDY,
  PARTLY_CLOUDY_DAY,
  PARTLY_CLOUDY_NIGHT,
  RAIN
}

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "rain": Icon.RAIN
});

enum Source {
  COMB,
  FCST,
  OBS
}

final sourceValues = EnumValues({
  "comb": Source.COMB,
  "fcst": Source.FCST,
  "obs": Source.OBS
});

enum StationElement {
  EGLC,
  EGLL,
  EGWU,
  F6665,
  F8628
}

final stationElementValues = EnumValues({
  "EGLC": StationElement.EGLC,
  "EGLL": StationElement.EGLL,
  "EGWU": StationElement.EGWU,
  "F6665": StationElement.F6665,
  "F8628": StationElement.F8628
});

class StationValue {
  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  StationElement? id;
  String? name;
  int? quality;
  double? contribution;

  StationValue({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  factory StationValue.fromRawJson(String str) => StationValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StationValue.fromJson(Map<String, dynamic> json) => StationValue(
    distance: json["distance"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    useCount: json["useCount"],
    //id: stationElementValues.map[json["id"]]!,
    name: json["name"],
    quality: json["quality"],
    contribution: json["contribution"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "latitude": latitude,
    "longitude": longitude,
    "useCount": useCount,
  //  "id": stationElementValues.reverse[id],
    "name": name,
    "quality": quality,
    "contribution": contribution,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
class Hours {
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  List<Icon>? preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  String? conditions;
  String? icon;
  dynamic stations;
  String? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  double? severerisk;
  String? description;

  Hours(
      {this.datetime,
        this.datetimeEpoch,
        this.temp,
        this.feelslike,
        this.humidity,
        this.dew,
        this.precip,
        this.precipprob,
        this.snow,
        this.snowdepth,
        this.preciptype,
        this.windgust,
        this.windspeed,
        this.winddir,
        this.pressure,
        this.visibility,
        this.cloudcover,
        this.solarradiation,
        this.solarenergy,
        this.uvindex,
        this.severerisk,
        this.conditions,
        this.icon,
        this.stations,
        this.source});

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    //preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['temp'] = temp;
    data['feelslike'] = feelslike;
    data['humidity'] = humidity;
    data['dew'] = dew;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['preciptype'] = preciptype;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['visibility'] = visibility;
    data['cloudcover'] = cloudcover;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['conditions'] = conditions;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    return data;
  }
}