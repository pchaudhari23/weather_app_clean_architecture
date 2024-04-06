import 'package:flutter/material.dart';

import 'features/weather_data/domain/usecases/get_weather_data.dart';

GetWeatherData? getWeatherData;

void main() {
  // runApp(const MyApp());
  getWeatherData?.call(const Params(location: 'Berlin'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Weather Application Home Page'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter location',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
