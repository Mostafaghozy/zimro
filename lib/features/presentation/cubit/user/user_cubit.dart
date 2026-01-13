import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zimro/core/api/api_consumer.dart';
import 'package:zimro/core/api/end_points.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;
  XFile? profilePic;

  void uploadProfilePic(XFile image) {
    profilePic = image;
    emit(ProfilePicUpdated());
  }

  Future<void> getUser() async {
    emit(UserLoading());

    try {
      final response = await api.get(EndPoints.me);

      emit(UserSuccess(response));
    } catch (e) {
      emit(UserFailure(e.toString(), errMessage: 'Failed to Uploaded Image'));
    }
  }
}
