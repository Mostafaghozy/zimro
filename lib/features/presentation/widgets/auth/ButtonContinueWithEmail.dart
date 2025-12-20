import 'package:zimro/features/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonContinueWithEmail extends StatelessWidget {
  const ButtonContinueWithEmail({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    this.text,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final String? text;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        final confirmPassword = confirmPasswordController?.text.trim();

        // START VALIDATION -------------------------------

        if (email.isEmpty) {
          showMsg(context, "Please enter your email");
          return;
        }

        if (!isValidEmail(email)) {
          showMsg(context, "Please enter a valid email address");
          return;
        }

        if (password.isEmpty) {
          showMsg(context, "Please enter your password");
          return;
        }

        if (password.length < 8) {
          showMsg(context, "Password must be at least 8 characters");
          return;
        }

        if (confirmPasswordController != null) {
          if (confirmPassword!.isEmpty) {
            showMsg(context, "Please confirm your password");
            return;
          }

          if (password != confirmPassword) {
            showMsg(context, "Passwords do not match");
            return;
          }
        }

        // END VALIDATION --------------------------------

        // CALL Cubit after validation success
        context.read<LoginCubit>().logIn(email: email, password: password);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 192, 187, 37),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text ?? "Continue with Email",
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  void showMsg(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 192, 187, 37),
      ),
    );
  }
}
