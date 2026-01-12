import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/core/api_keys.dart';

class LoginModel {
  String? email;
  String? password;
  String? accessToken;
  String? expiresAtUtc;
  String? refreshToken;

  LoginModel({
    this.email,
    this.password,
    this.accessToken,
    this.expiresAtUtc,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    email: json[LoginApiKey.email] as String?,
    password: json[LoginApiKey.password] as String?,
    accessToken: json[LoginApiKey.accessToken] as String?,
    expiresAtUtc: json[LoginApiKey.expiresAtUtc] as String?,
    refreshToken: json[LoginApiKey.refreshToken] as String?,
  );

  Map<String, dynamic> toJson() => {
    LoginApiKey.email: email,
    LoginApiKey.password: password,
  };
}
