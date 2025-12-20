import 'package:zimro/features/presentation/screens/payment/PaymentMethodsScreen.dart';
import 'package:zimro/features/presentation/widgets/RowProfileWidget.dart';
import 'package:flutter/material.dart';

class MyPaymentOption extends StatelessWidget {
  const MyPaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    return RowProfileWidget(
      imageAsset: 'assets/icons/credit-card.png',
      title: 'My payment option',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaymentMethodsPage()),
        );
      },
    );
  }
}
