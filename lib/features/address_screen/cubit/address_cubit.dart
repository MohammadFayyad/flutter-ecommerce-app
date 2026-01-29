import 'dart:developer';

import 'package:ecommerce_app/features/address_screen/cubit/address_state.dart';
import 'package:ecommerce_app/features/address_screen/repo/address_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo addressRepo;
  AddressCubit(this.addressRepo) : super(AddressInitialState());
  Future<void> getAddress() async {
    emit(AddressLoadingState());
    final address = await addressRepo.getAddress();
    if (isClosed) return;
    address.fold(
      (e) {
        log(e);
        emit(AddressErrorState(message: e));
      },
      (address) {
        log(address.address.toString());
        emit(AddressLoadedState(address: address));
      },
    );
  }
}
