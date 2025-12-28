import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/features/data/models/auth/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logIn({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      final loginModel = Login(email: email, password: password);

      final response = await Dio().post(
        "https://accessories-eshop.runasp.net/api/auth/login",
        data: loginModel.toJson(),
      );
      emit(LoginSuccess());
      print(response);
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
