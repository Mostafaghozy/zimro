import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zimro/features/presentation/screens/auth/BuildBox.dart';

class VerifyCodeInput extends StatelessWidget {
  final List<TextEditingController> controllers;

  VerifyCodeInput({super.key})
    : controllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return BuildBox(
          controllers: controllers,
          context: context,
          index: index,
        );
      }),
    );
  }
}
