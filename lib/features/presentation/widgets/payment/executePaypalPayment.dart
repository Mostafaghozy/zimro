import 'package:zimro/core/api_keys.dart';
import 'package:zimro/features/data/models/paypal/amount_model/amount_model.dart';
import 'package:zimro/features/data/models/paypal/item_list_model/item_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void executePaypalPayment(
  BuildContext context,
  AmountModel amount,
  ItemListModel itemList,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientIdPaypal,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": itemList.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
  );
}
