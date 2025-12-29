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
    email: json['email'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirmPassword'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
    'firstName': firstName,
    'lastName': lastName,
  };
}
