import 'package:ecommerce_app/features/address_screen/model/address_model.dart';

abstract class AddressState {}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressLoadedState extends AddressState {
  final AddressModel address;
  AddressLoadedState({required this.address});
}

class AddressErrorState extends AddressState {
  final String message;
  AddressErrorState({required this.message});
}
