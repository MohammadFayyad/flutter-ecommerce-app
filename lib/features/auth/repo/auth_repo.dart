import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/secure_storage.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';

class AuthRepo {
  AuthRepo({required this.dioHelper, required this.secureStorage});
  final DioHelper dioHelper;
  final SecureStorage secureStorage;
  Future<Either<String, LoginResponseModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      final Response response = await dioHelper.post(
        options: Options(headers: {'Content-Type': 'application/json'}),
        endPoint: ApiEndpoints.login,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromMap(
          response.data,
        );
        log(loginResponseModel.token!.isEmpty.toString());
        if (loginResponseModel.token != null &&
            loginResponseModel.token!.isNotEmpty) {
          secureStorage.saveToken(token: loginResponseModel.token);
          return Right(loginResponseModel);
        } else {
          return const Left('Login failed');
        }
      } else {
        return Left(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response!.data;
        if (data is Map && data['message'] != null) {
          return Left(data['message'].toString());
        } else if (data is String) {
          return Left(data);
        }
        return const Left('Server error');
      }
      return const Left('No internet connection');
    }
  }
}
