import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'http://api.weatherapi.com/v1',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData({
    String? url,
    Map<String, dynamic>? queryParameters,
  }) async {
    if(dio==null){
      init();
    }
    return await dio!.get("/current.json", queryParameters: {
      'key':'b8866a868bb84d42bbd120829231010',
      'q':"Cairo"
    });
  }

}
