class VerifyEmailModel {
  String? email;
  String? otp;

  VerifyEmailModel({this.email, this.otp});

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'otp': otp};
}
