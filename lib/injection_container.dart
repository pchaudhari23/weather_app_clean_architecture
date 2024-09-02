import 'package:get_it/get_it.dart';
import './features/weather_data/domain/usecases/get_weather_data.dart';
import './features/weather_data/data/datasources/weather_data_remote_data_source.dart';
import './features/weather_data/domain/repositories/weather_data_repository.dart';
import './features/weather_data/data/repositories/weather_data_repository_impl.dart';
import './features/weather_data/presentation/bloc/weather_data_barrel.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => WeatherDataBloc(getWeatherData: sl()));

  // Usecase
  sl.registerLazySingleton(() => GetWeatherData(sl()));

  // Repository
  sl.registerLazySingleton<WeatherDataRepository>(
    () => WeatherDataRepositoryImpl(
      weatherDataRemoteDataSource: sl(),
    ),
  );

  // Datasource
  sl.registerLazySingleton<WeatherDataRemoteDataSource>(
    () => WeatherDataRemoteDataSourceImpl(),
  );
}
