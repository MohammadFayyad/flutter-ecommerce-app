import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/address_screen/model/address_model.dart';

class AddressRepo {
  final DioHelper dioHelper;
  AddressRepo({required this.dioHelper});
  Future<Either<String, AddressModel>> getAddress() async {
    try {
      final response = await dioHelper.get(endPoint: '/users/4');
      log('success0');

      if (response.statusCode == 200) {
        log('success1');
        log(response.data.runtimeType.toString());
        final addressModel = AddressModel.fromMap(response.data);
        log('success2');
        return Right(addressModel);
      }
      return const Left('Failed to load address');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
