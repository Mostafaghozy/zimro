import 'package:dio/dio.dart';
import 'package:zimro/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}
 void handleDioExceptions(DioException e) {
     switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.sendTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.receiveTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.badCertificate:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: // Bad Request
    
          case 401:
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          // Unauthorized
          case 403:
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          // Forbidden
          case 404:
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          // Not Found
          case 409:
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          // Conflict
          case 422:
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          // Unprocessable Entity
          case 504: //Server Exception
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
        }
    
      case DioExceptionType.cancel:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.connectionError:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.unknown:
        throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
    }
  }
