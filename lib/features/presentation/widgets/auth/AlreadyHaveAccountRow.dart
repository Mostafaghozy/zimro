import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zimro/core/api/dio_consumer.dart';
import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/screens/auth/loginScreen.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already use zimro?", style: TextStyle(color: Colors.grey[600])),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => LoginCubit(DioConsumer(dio: Dio())),
                  child: LogInScreen(),
                ),
              ),
            );
          },
          child: Text("Log in", style: TextStyle(color: Color(0xff979423))),
        ),
      ],
    );
  }
}
