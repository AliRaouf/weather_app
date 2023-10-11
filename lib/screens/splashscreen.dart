import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/screens/homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: "cairo");
    Future.delayed(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
