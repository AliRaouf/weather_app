import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;
  String? image;
  getWeather(){
    emit(LoadWeatherState());
    DioHelper.getData().then((value) {
      emit(SuccessWeatherState());
    weatherModel=WeatherModel.fromJson(value.data);
    print(value.statusCode);
    print(weatherModel!.image);
    print(weatherModel!.condition);
    }
    ).catchError((error){
      emit(ErrorWeatherState());
      print(error);
      }

    );
  }
}
