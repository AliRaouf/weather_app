import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    WeatherModel? weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: "cairo");
    emit(WeatherInitial());
  }
}
