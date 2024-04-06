import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_architecture/core/error/failures.dart';
import 'package:weather_app_clean_architecture/features/weather_data/domain/entities/weather_data.dart';

abstract class WeatherDataRepository {
   
  Future<Either<Failure, Weather>> getWeatherData(String location);

}