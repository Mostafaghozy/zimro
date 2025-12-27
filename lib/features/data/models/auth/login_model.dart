class Login {
  String? email;
  String? password;

  Login({this.email, this.password});

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
