import 'package:flutter/material.dart';
import 'package:zimro/features/presentation/widgets/auth/VerifyButton.dart';
import 'package:zimro/features/presentation/widgets/auth/VerifyCodeInput.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Please check your email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "We've send a code to ",
                    style: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                  Text(
                    "mail@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              VerifyCodeInput(),
              SizedBox(height: 50),
              VerifyButton(
                onPressed: () {
                  // Handle verify action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
