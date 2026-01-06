import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/core/api_keys.dart';

class LoginModel {
  String? email;
  String? password;

  LoginModel({this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    email: json[LoginApiKey.email] as String?,
    password: json[LoginApiKey.password] as String?,
  );

  Map<String, dynamic> toJson() => {
    LoginApiKey.email: email,
    LoginApiKey.password: password,
  };
}
