class Register {
  String? email;
  String? password;
  String? firstName;
  String? lastName;

  Register({this.email, this.password, this.firstName, this.lastName});

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    email: json['email'] as String?,
    password: json['password'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
  };
}
