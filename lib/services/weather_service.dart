import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future <WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio.get(
          "http://api.weatherapi.com/v1/current.json?key=b8866a868bb84d42bbd120829231010&q=$cityName");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e){
      final String errorMessage=e.response?.data['error']['message']??"There was an error";
     throw Exception(errorMessage);
    }
  }
}