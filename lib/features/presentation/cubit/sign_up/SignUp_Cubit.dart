import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zimro/core/api/api_consumer.dart';
import 'package:zimro/core/api/end_points.dart';
import 'package:zimro/core/api_keys.dart';
import 'package:zimro/core/errors/exception.dart';

import 'package:zimro/features/data/models/auth/login_model.dart';
import 'package:zimro/features/data/models/auth/sign_up_model.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(SignUpInitial());
  final ApiConsumer api;
  XFile? profilePic;
  void pickProfileImage(XFile image) {
    profilePic = image;
    emit(SignUpImagePicked());
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      final formData = <String, dynamic>{
        SignUpApiKey.email: email,
        SignUpApiKey.password: password,
        SignUpApiKey.confirmPassword: confirmPassword,
        SignUpApiKey.firstName: firstName,
        SignUpApiKey.lastName: lastName,

        if (profilePic != null)
          UserApiKey.profilePicture: await MultipartFile.fromFile(
            profilePic!.path,
            filename: profilePic!.name,
          ),
      };

      final response = await api.post(EndPoints.register, data: formData);
      emit(SignUpSuccess());
      return response;
    } on ServerException catch (e) {
      emit(
        SignUpFailure(
          errMessage: e.errorModel.errors?.toString() ?? e.errorModel.message,
        ),
      );
    }
  }
}
