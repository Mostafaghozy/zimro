class ErrorModel {
  final int statusCode;
  final String message;
  final String errors;

  ErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData['statusCode'],
      message: jsonData['message'],
      errors: jsonData['errors'],
    );
  }
}
