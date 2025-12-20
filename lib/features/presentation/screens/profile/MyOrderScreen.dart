import 'package:zimro/features/presentation/screens/payment/my_orders_screen.dart';
import 'package:zimro/features/presentation/widgets/RowProfileWidget.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RowProfileWidget(
      imageAsset: 'assets/icons/codesandbox.png',
      title: 'My order',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
        );
      },
    );
  }
}
