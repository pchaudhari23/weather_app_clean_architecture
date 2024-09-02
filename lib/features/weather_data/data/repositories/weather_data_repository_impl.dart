import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/datasources/weather_data_remote_data_source.dart';
import '../../domain/entities/weather_data.dart';
import '../../domain/repositories/weather_data_repository.dart';

class WeatherDataRepositoryImpl implements WeatherDataRepository {
  final WeatherDataRemoteDataSource weatherDataRemoteDataSource;

  WeatherDataRepositoryImpl({required this.weatherDataRemoteDataSource});

  @override
  Future<Either<Failure, Weather>> getWeatherData(String location) async {
    return await weatherDataRemoteDataSource.getWeatherData(location);
  }
}
