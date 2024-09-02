import 'package:equatable/equatable.dart';
import '../../domain/entities/weather_data.dart';

abstract class WeatherDataState extends Equatable {
  const WeatherDataState();

  @override
  List<Object> get props => [];
}

class WeatherDataInitial extends WeatherDataState {}

class WeatherDataLoading extends WeatherDataState {}

class WeatherDataLoaded extends WeatherDataState {
  final Weather weather;

  const WeatherDataLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherDataError extends WeatherDataState {
  final String message;

  const WeatherDataError(this.message);

  @override
  List<Object> get props => [message];
}
