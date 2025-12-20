import 'package:zimro/features/presentation/screens/home/Root.dart';
import 'package:zimro/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:zimro/features/presentation/widgets/payment/CenterTextWidget.dart';
import 'package:zimro/features/presentation/widgets/payment/CustomContainerDeliveryStatus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeliveryStatusScreen extends StatelessWidget {
  const DeliveryStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery status",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Gap(20),
            CenterTextWidget(),
            Gap(20),
            CustomContainerDeliveryStatus(),
            Gap(100),
            CustomButtonToCheckout(
              text: 'Back to home',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RootScreen(initialIndex: 0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
