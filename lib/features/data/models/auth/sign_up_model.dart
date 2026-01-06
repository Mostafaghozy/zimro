import 'package:zimro/core/api_keys.dart';

class SignUpModel {
  String? email;
  String? password;
  String? confirmPassword;
  String? firstName;
  String? lastName;

  SignUpModel({
    this.email,
    this.password,
    this.confirmPassword,
    this.firstName,
    this.lastName,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    email: json[SignUpApiKey.email] as String?,
    password: json[SignUpApiKey.password] as String?,
    confirmPassword: json[SignUpApiKey.confirmPassword] as String?,
    firstName: json[SignUpApiKey.firstName] as String?,
    lastName: json[SignUpApiKey.lastName] as String?,
  );

  Map<String, dynamic> toJson() => {
    SignUpApiKey.email: email,
    SignUpApiKey.password: password,
    SignUpApiKey.confirmPassword: confirmPassword,
    SignUpApiKey.firstName: firstName,
    SignUpApiKey.lastName: lastName,
  };
}
