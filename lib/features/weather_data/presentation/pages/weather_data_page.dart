import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_data_bloc.dart';
import '../bloc/weather_data_event.dart';
import '../bloc/weather_data_state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: buildBody(context),
    );
  }
}

Widget buildBody(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<WeatherDataBloc, WeatherDataState>(
            builder: (context, state) {
              if (state is WeatherDataInitial) {
                return const Text('Enter a location to get weather');
              } else if (state is WeatherDataLoading) {
                return const CircularProgressIndicator();
              } else if (state is WeatherDataLoaded) {
                // return const Text('Data loaded');
                final weather = state.weather;
                return Column(
                  children: [
                    Text(
                      '${weather.location?.name}, ${weather.location?.country}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Image.network(weather
                    //     .current.weatherIcons[0]), // Display weather icon
                    // const SizedBox(height: 10),
                    Text(
                      'Temperature: ${weather.current?.temperature}°C',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${weather.location?.region}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Humidity: ${weather.current?.humidity}%',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Wind Speed: ${weather.current?.windSpeed} km/h',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Wind Direction: ${weather.current?.windDir}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Pressure: ${weather.current?.pressure} hPa',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'UV Index: ${weather.current?.uvIndex}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                );
              } else if (state is WeatherDataError) {
                return Text('Error: ${state.message}');
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Dispatch the event to fetch weather data
              context
                  .read<WeatherDataBloc>()
                  .add(const GetWeatherDataEvent('Moscow'));
            },
            child: const Text('Get Weather'),
          ),
        ],
      ),
    ),
  );
}

// body: BlocListener<WeatherDataBloc, WeatherDataState>(
//   listener: (context, state) {
//     if (state is WeatherDataInitial) {
//       print('State: WeatherDataInitial');
//     } else if (state is WeatherDataLoading) {
//       print('State: WeatherDataLoading');
//     } else if (state is WeatherDataLoaded) {
//       print('State: WeatherDataLoaded');
//       print('Weather Data: ${state.weather}');
//     } else if (state is WeatherDataError) {
//       print('State: WeatherDataError');
//       print('Error Message: ${state.message}');
//     }
//   },
//   child: Center(
//     child: ElevatedButton(
//       onPressed: () {
//         // Dispatch the event to fetch weather data
//         context
//             .read<WeatherDataBloc>()
//             .add(const GetWeatherDataEvent('Berlin'));
//       },
//       child: const Text('Get Weather Data'),
//     ),
//   ),
// ),