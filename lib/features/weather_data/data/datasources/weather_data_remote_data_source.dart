import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../features/weather_data/data/models/weather_data_model.dart';

String apikey = '0da5ce99a10b05e6a2feb1e4d60dc026';

abstract class WeatherDataRemoteDataSource {
  Future<Either<Failure, WeatherModel>> getWeatherData(String location);
}

class WeatherDataRemoteDataSourceImpl implements WeatherDataRemoteDataSource {
  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(String location) async {
    String apiUrl =
        'http://api.weatherstack.com/current?access_key=$apikey&query=$location';

    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      final res = WeatherModel.fromJson(json.decode(response.body));
      print(res);
      return Right(res);
    } else {
      throw ServerException();
    }
  }
}
