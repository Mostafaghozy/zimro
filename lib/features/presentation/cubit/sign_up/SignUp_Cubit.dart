import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/features/data/models/auth/SignUp_model.dart';
import 'package:zimro/features/data/models/auth/login_model.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({required String email, required String password}) async {
    try {
      emit(SignUpLoading());
      final signUpModel = SignUpModel(email: email, password: password);

      final response = await Dio().post(
        "https://accessories-eshop.runasp.net/api/auth/register",
        data: signUpModel.toJson(),
      );
      emit(SignUpSuccess());
      print(response);
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
