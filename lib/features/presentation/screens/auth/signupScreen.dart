import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_Cubit.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_state.dart';
import 'package:zimro/features/presentation/screens/auth/loginScreen.dart';
import 'package:zimro/features/presentation/widgets/auth/AlreadyHaveAccountRow.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonContinueLogin.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonLoginWith.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonSignUp.dart';
import 'package:zimro/features/presentation/widgets/auth/PasswordField.dart';
import 'package:zimro/features/presentation/widgets/auth/RowFirstAndLastName.dart';
import 'package:zimro/features/presentation/widgets/auth/TermsAndPrivacyText.dart';
import 'package:zimro/features/presentation/widgets/auth/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Sign Up Successful")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

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
                  Center(child: Image.asset('assets/logo.png')),
                  const SizedBox(height: 60),
                  RowFirstAndLastName(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                  ),
                  const SizedBox(height: 10),

                  CustomInputField(
                    label: 'Email',
                    controller: emailController,
                    radius: 10,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  CustomInputField(
                    label: 'Password',
                    controller: passwordController,
                    radius: 10,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    errorText: confirmPasswordError,
                  ),

                  const SizedBox(height: 10),
                  CustomInputField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    radius: 10,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    errorText: confirmPasswordError,
                  ),

                  const SizedBox(height: 20),
                  ButtonSignUp(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    isLoading: state is SignUpLoading,
                    onSignUp:
                        (
                          firstName,
                          lastName,
                          email,
                          password,
                          confirmPassword,
                        ) {
                          context.read<SignUpCubit>().signUp(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                          );
                        },
                  ),

                  const SizedBox(height: 10),
                  const AlreadyHaveAccountRow(),
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
                  SizedBox(height: 30),
                  const TermsAndPrivacyText(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
