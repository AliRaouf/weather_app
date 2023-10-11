import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/screens/splashscreen.dart';

import '../screens/homescreen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
