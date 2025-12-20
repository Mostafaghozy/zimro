import 'package:zimro/features/presentation/widgets/order/CustomButtonOrderInfo.dart';
import 'package:zimro/features/presentation/widgets/order/buildDeliveryInfo.dart';
import 'package:zimro/features/presentation/widgets/order/buildOrderInfo.dart';
import 'package:zimro/features/presentation/widgets/order/buildPaymentInfo.dart';
import 'package:zimro/features/presentation/widgets/order/buildProductItem.dart';

import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #10802012',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 7),
            buildOrderInfo(),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
            buildProductsList(),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomButtonOrderInfo(
                    text: 'Invoice',
                    width: 120,
                    height: 30,
                    image: 'assets/icons/file-text.png',
                  ),
                  SizedBox(width: 10),
                  CustomButtonOrderInfo(
                    text: 'Write review',
                    width: 150,
                    height: 30,
                    image: 'assets/icons/message-square.png',
                  ),
                  SizedBox(width: 10),
                  CustomButtonOrderInfo(
                    text: 'Track my order',
                    width: 160,
                    height: 30,
                    image: 'assets/icons/disc.png',
                    color: Colors.limeAccent.withOpacity(0.5),
                  ),
                ],
              ),
            ),

            buildDeliveryInfo(),
            const SizedBox(height: 5),
            buildPaymentInfo(),
          ],
        ),
      ),
    );
  }
}
