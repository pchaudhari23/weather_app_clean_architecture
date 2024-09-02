import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/weather_data.dart';
import '../repositories/weather_data_repository.dart';

class GetWeatherData implements UseCase<Weather, Params> {
  final WeatherDataRepository weatherDataRepository;

  GetWeatherData(this.weatherDataRepository);

  @override
  Future<Either<Failure, Weather>> call(Params params) async {
    return await weatherDataRepository.getWeatherData(params.location);
  }
}

class Params extends Equatable {
  final String location;

  const Params({required this.location});

  @override
  List<Object?> get props => throw UnimplementedError();
}
