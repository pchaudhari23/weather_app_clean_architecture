// import 'package:bloc/bloc.dart';
// // import 'package:equatable/equatable.dart';

// import '../../domain/usecases/get_weather_data.dart';
// import './weather_data_event.dart';
// import './weather_data_state.dart';

// class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
//   final GetWeatherData getWeatherData;

//   WeatherDataBloc({required this.getWeatherData}) : super(WeatherDataInitial());

//   // @override
//   // WeatherDataState get initialState => WeatherDataInitial();

//   // @override
//   Stream<WeatherDataState> mapEventToState(WeatherDataEvent event) async* {
//     if (event is GetWeatherDataEvent) {
//       print('loading');
//       yield WeatherDataLoading();
//       final response = await getWeatherData(const Params(location: 'Berlin'));
//       print('loaded');
//       yield response.fold(
//           (failure) => const WeatherDataError('Failed to fetch weather data'),
//           (weather) => WeatherDataLoaded(weather));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_weather_data.dart';
import './weather_data_event.dart';
import './weather_data_state.dart';

class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {
  final GetWeatherData getWeatherData;
  WeatherDataBloc({required this.getWeatherData})
      : super(WeatherDataInitial()) {
    // Registering the event handler for GetWeatherDataEvent
    on<GetWeatherDataEvent>(_onGetWeatherData);
  }
  Future<void> _onGetWeatherData(
      GetWeatherDataEvent event, Emitter<WeatherDataState> emit) async {
    emit(WeatherDataLoading());
    try {
      final weather = await getWeatherData(Params(location: event.location));
      weather.fold(
          (failure) => const WeatherDataError('Failed to fetch weather data'),
          (weather) => WeatherDataLoaded(weather));
      //  emit(WeatherDataLoaded(weather));
    } catch (error) {
      emit(WeatherDataError(error.toString()));
    }
  }
}
