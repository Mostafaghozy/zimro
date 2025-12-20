import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/screens/auth/loginScreen.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonContinueWithEmail.dart';
import 'package:zimro/features/presentation/widgets/auth/ButtonLoginWith.dart';
import 'package:zimro/features/presentation/widgets/custom_input_field.dart';
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

              CustomInputField(
                label: 'Email',
                controller: emailController,
                radius: 10,
                keyboardType: TextInputType.emailAddress,
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
              CustomInputField(
                label: 'Confirm Password',
                controller: confirmPasswordController,
                radius: 10,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                errorText: confirmPasswordError,
              ),
              const SizedBox(height: 20),
              ButtonContinueWithEmail(
                text: "Sign Up",
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
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
                icon: const Icon(Icons.apple, color: Colors.white, size: 24),
                label: 'Continue with Apple',
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              ButtonLoginWith(
                icon: Image.asset('assets/google.png', height: 24, width: 24),
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
  }
}
