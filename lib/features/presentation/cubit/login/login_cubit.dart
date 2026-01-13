import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/cache/cache_helper.dart';
import 'package:zimro/core/api/api_consumer.dart';
import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/core/api_keys.dart';
import 'package:zimro/core/errors/exception.dart';
import 'package:zimro/features/data/models/auth/login_model.dart';
import 'package:zimro/features/presentation/cubit/login/login_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());

  final ApiConsumer api;
  LoginModel? user;

  Future<void> logIn({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await api.post(
        EndPoints.login,
        data: {LoginApiKey.email: email, LoginApiKey.password: password},
      );
      emit(LoginSuccess());
      user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.accessToken!);
      CacheHelper.saveData(
        key: LoginApiKey.accessToken,
        value: user!.accessToken!,
      );
      CacheHelper.saveData(
        key: UserApiKey.userId,
        value: decodedToken[UserApiKey.userId],
      );
    } on ServerException catch (e) {
      emit(
        LoginFailure(
          errMessage: e.errorModel.errors?.toString() ?? e.errorModel.message,
        ),
      );
    }
  }
}
