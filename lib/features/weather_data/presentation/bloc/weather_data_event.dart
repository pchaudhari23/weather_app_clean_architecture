import 'package:equatable/equatable.dart';

abstract class WeatherDataEvent extends Equatable {
  const WeatherDataEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherDataEvent extends WeatherDataEvent {
  final String location;

  const GetWeatherDataEvent(this.location);

  @override
  List<Object> get props => [location];
}
