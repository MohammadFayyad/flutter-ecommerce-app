class LoginResponseModel {
  String? token;
  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(token: map['token']);
  }
}
