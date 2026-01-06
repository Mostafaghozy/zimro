import 'package:dio/dio.dart';
import 'package:zimro/core/api/api_consumer.dart';
import 'package:zimro/core/api/dio_consumer.dart';
import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/cubit/login/login_state.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_Cubit.dart';
import 'package:zimro/features/presentation/screens/auth/signupScreen.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonContinueLogin.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonLoginWith.dart';
import 'package:zimro/features/presentation/widgets/auth/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(("success"))));
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text((state.errMessage))));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 25,
                          color: Color.fromARGB(255, 192, 187, 37),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Center(child: Image.asset('assets/logo.png')),
                  const SizedBox(height: 60),

                  CustomInputField(
                    label: 'Email',
                    controller: emailController,
                    radius: 10,
                    keyboardType: TextInputType.emailAddress,
                    errorText: emailError,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: 'Password',
                    controller: passwordController,
                    radius: 10,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    errorText: passwordError,
                  ),
                  const SizedBox(height: 20),
                  state is LoginLoading
                      ? const CircularProgressIndicator()
                      : ButtonContinueLogin(
                          emailController: emailController,
                          passwordController: passwordController,
                        ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (_) =>
                                    SignUpCubit(DioConsumer(dio: Dio())),
                                child: SignUpScreen(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Color(0xff979423)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ButtonLoginWith(
                    icon: const Icon(
                      Icons.apple,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: 'Continue with Apple',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 15),
                  ButtonLoginWith(
                    icon: Image.asset(
                      'assets/google.png',
                      height: 24,
                      width: 24,
                    ),
                    label: 'Continue with Google',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
