import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_weather_data.dart';
import './weather_data_event.dart';
import './weather_data_state.dart';

class WeatherDataBloc extends Bloc<WeatherDataEvent, WeatherDataState> {

  final GetWeatherData getWeatherData;

  WeatherDataBloc(super.initialState, {required this.getWeatherData});

  @override
  WeatherDataState get initialState => WeatherDataInitial();

  @override
  Stream<WeatherDataState> mapEventToState(WeatherDataEvent event) async* {
    if(event is GetWeatherDataEvent) {
      yield WeatherDataLoading();
      final data = await getWeatherData(const Params(location: 'Berlin'));
    }
  }
}
