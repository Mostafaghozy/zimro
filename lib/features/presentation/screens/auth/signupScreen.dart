import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_Cubit.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_state.dart';
import 'package:zimro/features/presentation/screens/auth/loginScreen.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonContinueWithEmail.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonLoginWith.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonSignUp.dart';
import 'package:zimro/features/presentation/widgets/auth/PasswordField.dart';
import 'package:zimro/features/presentation/widgets/auth/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  @override
  void dispose() {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomInputField(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        label: 'First Name',
                        radius: 10,
                        keyboardType: TextInputType.name,
                        obscureText: true,
                      ),

                      CustomInputField(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        label: 'Last Name',
                        radius: 10,
                        keyboardType: TextInputType.name,
                        obscureText: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  CustomInputField(
                    label: 'Email',
                    controller: emailController,
                    radius: 10,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  PasswordField(
                    label: 'Password',
                    controller: passwordController,
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
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    isLoading: state is SignUpLoading,
                    onSignUp: (email, password, confirmPassword) {
                      context.read<SignUpCubit>().signUp(
                        email: email,
                        password: password,
                        confirmPassword: confirmPassword,
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already use zimro?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => LoginCubit(),
                                child: LogInScreen(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Log in",
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
                  SizedBox(height: 30),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        children: const [
                          TextSpan(text: 'By signing up you accept the '),
                          TextSpan(
                            text: '\nTerm of service',
                            style: TextStyle(color: Color(0xff979423)),
                            // recognizer: TapGestureRecognizer()..onTap = () => launch('URL'),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Color(0xff979423)),
                            // recognizer: TapGestureRecognizer()..onTap = () => launch('URL'),
                          ),
                        ],
                      ),
                    ),
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
