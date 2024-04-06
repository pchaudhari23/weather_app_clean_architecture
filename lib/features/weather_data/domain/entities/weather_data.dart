import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final Request? request;
  final Location? location;
  final Current? current;

  const Weather({
    required this.request,
    required this.location,
    required this.current,
  });
     
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Current extends Equatable{
  final String? observationTime;
  final int? temperature;
  final int? weatherCode;
  final List<String>? weatherIcons;
  final List<String>? weatherDescriptions;
  final int? windSpeed;
  final int? windDegree;
  final String? windDir;
  final int? pressure;
  final int? precip;
  final int? humidity;
  final int? cloudcover;
  final int? feelslike;
  final int? uvIndex;
  final int? visibility;
  final String? isDay;

  const Current({
    required this.observationTime,
    required this.temperature,
    required this.weatherCode,
    required this.weatherIcons,
    required this.weatherDescriptions,
    required this.windSpeed,
    required this.windDegree,
    required this.windDir,
    required this.pressure,
    required this.precip,
    required this.humidity,
    required this.cloudcover,
    required this.feelslike,
    required this.uvIndex,
    required this.visibility,
    required this.isDay,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  
}

class Location extends Equatable{
  final String? name;
  final String? country;
  final String? region;
  final String? lat;
  final String? lon;
  final String? timezoneId;
  final String? localtime;
  final int? localtimeEpoch;
  final String? utcOffset;

  const Location({
    required this.name,
    required this.country,
    required this.region,
    required this.lat,
    required this.lon,
    required this.timezoneId,
    required this.localtime,
    required this.localtimeEpoch,
    required this.utcOffset,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Request extends Equatable{
  final String? type;
  final String? query;
  final String? language;
  final String? unit;
  
  const Request({
    required this.type,
    required this.query,
    required this.language,
    required this.unit,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
