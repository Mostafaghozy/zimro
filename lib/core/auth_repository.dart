import 'package:zimro/core/api/api_consumer.dart';
import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/features/data/models/auth/login_model.dart';
import 'package:zimro/core/errors/exception.dart';
import 'package:zimro/features/data/models/auth/sign_up_model.dart';

class AuthRepository {
  final ApiConsumer api;

  AuthRepository({required this.api});

  Future<dynamic> login(LoginModel user) async {
    try {
      final response = await api.post(EndPoints.login, data: user.toJson());

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> onSignUp(SignUpModel user) async {
    try {
      final response = await api.post(EndPoints.register, data: user.toJson());

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
