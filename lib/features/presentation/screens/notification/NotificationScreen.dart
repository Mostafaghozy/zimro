import 'package:zimro/features/presentation/widgets/notification/ContainerWidgetNotification.dart';
import 'package:zimro/features/presentation/widgets/notification/TextButtonMarkAllWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white60),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButtonMarkAllWidget(),
              ],
            ),
            Gap(20),
            ContainerWidgetNotification(
              image: 'assets/all_product/sale.png',
              text: 'Wome’s clothes flash sale 🎉',
              bottomText: 'Upto 50% off on asos, nike, puma, Adidas \n& more',
            ),
            Divider(thickness: 1, color: Colors.white24),
            ContainerWidgetNotification(
              image: 'assets/all_product/sale2.png',
              text: 'A classic never goes out of style🎉',
              bottomText: 'Upto 50% off onsalwar suite \n&sets',
            ),
            Divider(thickness: 1, color: Colors.white24),
            ContainerWidgetNotification(
              image: 'assets/all_product/Product4_Home3.png',
              text:
                  'Your women’s casual linen trouser \nis waiting in your cart.',
            ),
            Divider(thickness: 1, color: Colors.white24),
            ContainerWidgetNotification(
              image: 'assets/modelGirl2.png',
              text:
                  'Your women’s casual linen trouser \nis waiting in your cart.',
            ),
            Divider(thickness: 1, color: Colors.white24),
          ],
        ),
      ),
    );
  }
}
