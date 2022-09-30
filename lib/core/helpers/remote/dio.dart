import 'package:dio/dio.dart';
import 'package:foody/core/helpers/constants.dart';

class DioHelper {
  static Dio? dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  static init() {
    dio;
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      '': '',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      '': token,
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
