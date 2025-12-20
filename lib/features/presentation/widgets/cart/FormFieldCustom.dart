import 'package:zimro/features/presentation/widgets/cart/CreditCardNumberFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldCustom extends StatelessWidget {
  const FormFieldCustom({
    super.key,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.isCardNumber = false,
  });
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool isCardNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: Border.all(width: 1, color: Colors.grey.shade700),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: TextFormField(
          keyboardType:
              keyboardType ??
              (isCardNumber ? TextInputType.number : TextInputType.text),
          style: TextStyle(color: Colors.grey.shade700),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          ),
          inputFormatters:
              inputFormatters ??
              (isCardNumber
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                      CreditCardNumberFormatter(),
                    ]
                  : [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))]),
        ),
      ),
    );
  }
}
