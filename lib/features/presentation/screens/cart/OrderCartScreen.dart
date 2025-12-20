import 'package:zimro/features/presentation/widgets/cart/ContainerOrderCart.dart';
import 'package:zimro/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:zimro/features/presentation/screens/cart/CheckoutScreen.dart';
import 'package:zimro/features/presentation/widgets/cart/CustomRowTotalCheck.dart';
import 'package:zimro/features/presentation/widgets/cart/DashedLineWithContainer.dart';
import 'package:zimro/features/presentation/widgets/cart/promoCodeWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderCartScreen extends StatefulWidget {
  const OrderCartScreen({super.key});

  @override
  State<OrderCartScreen> createState() => _OrderCartScreenState();
}

class _OrderCartScreenState extends State<OrderCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "My cart",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              ContainerOrderCart(),
              Gap(10),
              ContainerOrderCart(),
              Gap(30),
              PromoCodeWidget(),
              Gap(30),
              CustomRowTotalCheck(title: 'Sub total', price: '\$120.85'),
              Gap(20),
              CustomRowTotalCheck(title: 'Shipping fee', price: '\$5.02'),
              Gap(20),
              DashedLineWithContainers(),
              Gap(20),
              CustomRowTotalCheck(title: 'Total', price: '\$171.00'),
              Gap(30),
              CustomButtonToCheckout(
                text: 'Proceed to Checkout',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
