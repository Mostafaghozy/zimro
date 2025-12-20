import 'package:zimro/features/data/models/paypal/amount_model/amount_model.dart';
import 'package:zimro/features/data/models/paypal/amount_model/details.dart';
import 'package:zimro/features/data/models/paypal/item_list_model/item.dart';
import 'package:zimro/features/data/models/paypal/item_list_model/item_list_model.dart';
import 'package:zimro/features/presentation/widgets/payment/executePaypalPayment.dart';
import 'package:flutter/material.dart';

class PaypalCheckoutWidget extends StatelessWidget {
  const PaypalCheckoutWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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

      child: Container(
        width: 125,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
