import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_clean_architecture/features/weather_data/presentation/bloc/weather_data_bloc.dart';
import 'package:weather_app_clean_architecture/injection_container.dart';
import 'features/weather_data/presentation/pages/weather_data_page.dart';
import './injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<WeatherDataBloc>(),
      child: MaterialApp(
        title: 'Weather Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}
