import 'package:weather_app_clean_architecture/features/weather_data/domain/entities/weather_data.dart';

class WeatherModel extends Weather {

  const WeatherModel({
    RequestModel? request,
    LocationModel? location,
    CurrentModel? current
  }): super(request: request, location: location,current: current);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      request:
          json["request"] == null ? null : RequestModel.fromJson(json["request"]),
      location:
          json["location"] == null ? null : LocationModel.fromJson(json["location"]),
      current:
          json["current"] == null ? null : CurrentModel.fromJson(json["current"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "request": (request as RequestModel).toJson(),
    "location": (location as LocationModel).toJson(),
    "current": (current as CurrentModel).toJson(),
  };
}

class CurrentModel extends Current {
  
  const CurrentModel({
    String? observationTime,
    int? temperature,
    int? weatherCode,
    List<String>? weatherIcons,
    List<String>? weatherDescriptions,
    int? windSpeed,
    int? windDegree,
    String? windDir,
    int? pressure,
    int? precip,
    int? humidity,
    int? cloudcover,
    int? feelslike,
    int? uvIndex,
    int? visibility,
    String? isDay
  }) : super(
    observationTime: observationTime,
    temperature : temperature,
    weatherCode:weatherCode,
    weatherIcons:weatherIcons,
    weatherDescriptions:weatherDescriptions,
    windSpeed:windSpeed,
    windDegree:windDegree,
    windDir:windDir,
    pressure:pressure,
    precip:precip,
    humidity:humidity,
    cloudcover:cloudcover,
    feelslike:feelslike,
    uvIndex:uvIndex,
    visibility:visibility,
    isDay:isDay
  );

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      observationTime: json["observation_time"],
      temperature: json["temperature"],
      weatherCode: json["weather_code"],
      weatherIcons: json["weather_icons"] == null
          ? []
          : List<String>.from(json["weather_icons"]!.map((x) => x)),
      weatherDescriptions: json["weather_descriptions"] == null
          ? []
          : List<String>.from(json["weather_descriptions"]!.map((x) => x)),
      windSpeed: json["wind_speed"],
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressure: json["pressure"],
      precip: json["precip"],
      humidity: json["humidity"],
      cloudcover: json["cloudcover"],
      feelslike: json["feelslike"],
      uvIndex: json["uv_index"],
      visibility: json["visibility"],
      isDay: json["is_day"],
    );
  }

  Map<String, dynamic> toJson() => {
        "observation_time": observationTime,
        "temperature": temperature,
        "weather_code": weatherCode,
        "weather_icons": weatherIcons?.map((x) => x).toList(),
        "weather_descriptions": weatherDescriptions?.map((x) => x).toList(),
        "wind_speed": windSpeed,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure": pressure,
        "precip": precip,
        "humidity": humidity,
        "cloudcover": cloudcover,
        "feelslike": feelslike,
        "uv_index": uvIndex,
        "visibility": visibility,
        "is_day": isDay,
      };
}

class LocationModel extends Location {

  const LocationModel({
    String? name,
    String? country,
    String? region,
    String? lat,
    String? lon,
    String? timezoneId,
    String? localtime,
    int? localtimeEpoch,
    String? utcOffset
  }) : super(
    name: name,
    country: country,
    region: region,
    lat: lat,
    lon: lon,
    timezoneId: timezoneId,
    localtime: localtime,
    localtimeEpoch: localtimeEpoch,
    utcOffset: utcOffset
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json["name"],
      country: json["country"],
      region: json["region"],
      lat: json["lat"],
      lon: json["lon"],
      timezoneId: json["timezone_id"],
      localtime: json["localtime"],
      localtimeEpoch: json["localtime_epoch"],
      utcOffset: json["utc_offset"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "region": region,
        "lat": lat,
        "lon": lon,
        "timezone_id": timezoneId,
        "localtime": localtime,
        "localtime_epoch": localtimeEpoch,
        "utc_offset": utcOffset,
      };
}

class RequestModel extends Request {

  const RequestModel({
    String? type,
    String? query,
    String? language,
    String? unit,
  }): super(
    type: type,
    query: query,
    language: language,
    unit: unit
  );

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      type: json["type"],
      query: json["query"],
      language: json["language"],
      unit: json["unit"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": query,
        "language": language,
        "unit": unit,
      };
}
