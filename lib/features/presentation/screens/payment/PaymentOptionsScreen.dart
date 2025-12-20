import 'package:zimro/features/data/models/paypal/amount_model/amount_model.dart';
import 'package:zimro/features/data/models/paypal/amount_model/details.dart';
import 'package:zimro/features/data/models/paypal/item_list_model/item.dart';
import 'package:zimro/features/data/models/paypal/item_list_model/item_list_model.dart';
import 'package:zimro/features/presentation/widgets/payment/PaymentOptionsWidget.dart';

import 'package:zimro/features/presentation/screens/payment/CreditCardScreen.dart';
import 'package:zimro/features/presentation/widgets/payment/executePaypalPayment.dart';
import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Pay with',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Jost',
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'payment currency: ',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                children: [
                  TextSpan(
                    text: 'USD',
                    style: TextStyle(fontSize: 16, color: Colors.yellow[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            PaymentOptionsWidget(
              image: 'assets/pay/credit-card.png',
              title: 'Credit or debit card',
              onTap: () async {
                final newCard = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardDetailsScreen(),
                  ),
                );

                if (newCard != null && mounted) {
                  Navigator.pop(context, newCard);
                }
              },
            ),

            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),

            PaymentOptionsWidget(
              image: 'assets/pay/PayPal.png',
              title: 'PayPal',
              hasWhiteBackground: true,
              onTap: () {
                var amount = AmountModel(
                  currency: "USD",
                  details: Details(
                    shipping: '0',
                    subtotal: '70',
                    shippingDiscount: '0',
                  ),
                  total: "70",
                );
                List<OrderItemModel> orders = [
                  OrderItemModel(
                    currency: "USD",
                    name: "Apple",
                    price: "5",
                    quantity: 4,
                  ),
                  OrderItemModel(
                    name: "Pineapple",
                    quantity: 5,
                    price: '10',
                    currency: "USD",
                  ),
                ];
                var itemList = ItemListModel(orders: orders);
                executePaypalPayment(context, amount, itemList);
              },
            ),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),

            PaymentOptionsWidget(
              image: 'assets/pay/ApplePay.png',
              title: 'Apple Pay',
              hasWhiteBackground: true,
            ),
            Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
}
