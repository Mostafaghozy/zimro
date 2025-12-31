import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zimro/features/data/models/auth/login_model.dart';
import 'package:zimro/features/data/models/auth/sign_up_model.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String confirmPassword,
  }) async {
    try {
      emit(SignUpLoading());

      final signUpModel = SignUpModel(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        firstName: firstName,
        lastName: lastName,
      );

      await Dio().post(
        "https://accessories-eshop.runasp.net/api/auth/register",
        data: signUpModel.toJson(),
      );

      emit(SignUpSuccess());
    } catch (e) {
      if (e is DioException) {
        final errorResponse = e.response?.data;
        final errorMessage =
            errorResponse?['message'] ??
            errorResponse?['errors']?.toString() ??
            'Unknown error occurred';

        print(' SignUp Error: $errorMessage');
        print(' Full Response: $errorResponse');
        print(' Status Code: ${e.response?.statusCode}');

        emit(SignUpFailure(errMessage: errorMessage));
      } else {
        print('SignUp Unexpected Error: ${e.toString()}');
        emit(SignUpFailure(errMessage: e.toString()));
      }
    }
  }
}
