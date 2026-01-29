import 'package:ecommerce_app/core/utils/secure_storage.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this.secureStorage);
  final SecureStorage secureStorage;
  Future<bool> isLoggedIn() async {
    final token = await secureStorage.getToken();

    return token != null && token.isNotEmpty;
  }
}
