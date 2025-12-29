import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:zimro/features/presentation/cubit/sign_up/SignUp_Cubit.dart';
import 'package:zimro/features/presentation/widgets/imageCustom.dart';
import 'package:zimro/features/presentation/widgets/auth/glass_button.dart';
import 'package:zimro/features/presentation/screens/auth/loginScreen.dart';
import 'package:zimro/features/presentation/screens/auth/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageCustom(imagePath: "assets/image.png"),
          Container(color: Colors.black.withOpacity(0.50)),
          Positioned(
            bottom: 200,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The latest clothes \nof the day",
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "A premium online store for Men & women to find their stylish choice.",
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                GlassButton(
                  label: 'Sign Up',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (_) => SignUpCubit(),
                          child: SignUpScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                GlassButton(
                  label: 'Log In',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (_) => LoginCubit(),
                          child: LogInScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
