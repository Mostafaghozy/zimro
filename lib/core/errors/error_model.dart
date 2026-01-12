import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/core/api_keys.dart';

class ErrorModel {
  final int statusCode;
  final String message;
  final dynamic errors;

  ErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[LoginApiKey.statusCode],
      message: jsonData[LoginApiKey.message],
      errors: jsonData[LoginApiKey.errors],
    );
  }
}
