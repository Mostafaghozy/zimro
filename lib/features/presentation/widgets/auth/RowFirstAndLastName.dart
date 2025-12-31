import 'package:flutter/material.dart';
import 'package:zimro/features/presentation/widgets/auth/custom_input_field.dart';

class RowFirstAndLastName extends StatelessWidget {
  const RowFirstAndLastName({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomInputField(
          width: (MediaQuery.of(context).size.width - 40) / 2,
          label: 'First Name',
          controller: firstNameController,
          radius: 10,
          keyboardType: TextInputType.name,
          obscureText: false,
        ),

        CustomInputField(
          width: (MediaQuery.of(context).size.width - 40) / 2,
          label: 'Last Name',
          controller: lastNameController,
          radius: 10,
          keyboardType: TextInputType.name,
          obscureText: false,
        ),
      ],
    );
  }
}
