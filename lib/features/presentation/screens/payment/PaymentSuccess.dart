import 'package:zimro/features/presentation/screens/home/Root.dart';
import 'package:zimro/features/presentation/screens/payment/DeliveryStatusScreen.dart';
import 'package:zimro/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Image.asset("assets/Frame.png"),
                Positioned(
                  bottom: 15,
                  left: 40,
                  child: Text(
                    "Payment success!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Gap(10),
          Text(
            "Payment is completed!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Gap(10),
          Text(
            "your order number is #1089324",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          Gap(35),
          CustomButtonToCheckout(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryStatusScreen(),
                ),
              );
            },
            text: "Order deliver status",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          CustomButtonToCheckout(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RootScreen(initialIndex: 0),
                ),
              );
            },
            text: "Homepage",
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
