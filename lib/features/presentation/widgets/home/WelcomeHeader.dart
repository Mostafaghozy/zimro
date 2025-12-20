import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome", style: TextStyle(fontSize: 18)),
        Text(
          "zimro store!",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
