import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  late final Dio dio;
  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await dio.get(endPoint, queryParameters: query);
      return response;
    } on DioException catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint(e.message);
      rethrow;
    }
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
    required Options options,
  }) async {
    return await dio.post(endPoint, data: data, queryParameters: query);
  }

  Future<Response> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio.put(endPoint, data: data, queryParameters: query);
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
