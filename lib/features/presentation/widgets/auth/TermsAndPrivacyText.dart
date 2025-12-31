import 'package:flutter/material.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
