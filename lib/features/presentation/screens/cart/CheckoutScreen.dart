import 'package:zimro/features/data/models/stripe/payment_intent_input_model.dart';
import 'package:zimro/features/data/repositories/checkout_repo_impl.dart';
import 'package:zimro/features/presentation/cubit/stripe/stripe_payment_cubit.dart';
import 'package:zimro/features/presentation/screens/payment/PaymentSuccess.dart';
import 'package:zimro/features/presentation/widgets/cart/ComtainerChangeAddressWidget.dart';
import 'package:zimro/features/presentation/widgets/cart/ContainerPayWidget.dart';

import 'package:zimro/features/presentation/widgets/cart/CustomButtonToCheckout.dart';
import 'package:zimro/features/presentation/widgets/cart/CustomRowTotalCheck.dart';
import 'package:zimro/features/presentation/widgets/cart/PaypalCheckoutWidget.dart';
import 'package:zimro/features/presentation/widgets/cart/RowTwoDividersWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white70),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkout",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Gap(20),
              Text(
                "Delivery to",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              ContainerChangeAddressWidget(),

              Gap(20),
              Text(
                "Payment methods",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Gap(10),
              Row(
                children: [
                  PaypalCheckoutWidget(
                    image: 'assets/pay/paypal (2) 1 (1).png',
                  ),
                  Gap(10),
                  ContainerPayWidget(image: 'assets/pay/apple pay.png'),
                  Gap(10),
                  ContainerPayWidget(image: 'assets/pay/gpay.png'),
                ],
              ),
              Gap(20),
              RowTwoDividersWidget(),
              Gap(10),
              // Text(
              //   "Card information",
              //   style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              // ),
              // Gap(5),
              // FormFieldCustom(
              //   hintText: '**** **** **** ****',
              //   isCardNumber: true,
              // ),
              // Gap(10),
              // Text(
              //   "Card holder name",
              //   style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              // ),
              // Gap(5),
              // FormFieldCustom(hintText: '', isCardNumber: false),
              // Gap(10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Country or region",
              //       style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
              //     ),

              //     Padding(
              //       padding: const EdgeInsets.only(right: 110),
              //       child: Text(
              //         "Zip",
              //         style: TextStyle(
              //           color: Colors.grey.shade700,
              //           fontSize: 12,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Gap(5),
              // Row(children: [CountryDropdown(), Gap(20), ZipCodeContainer()]),
              Gap(30),
              CustomRowTotalCheck(title: 'Total', price: '\$171.00'),
              Gap(20),
              BlocProvider(
                create: (context) => StripePaymentCubit(CheckoutRepoImpl()),
                child: BlocConsumer<StripePaymentCubit, StripePaymentState>(
                  listener: (context, state) {
                    if (state is StripePaymentSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentSuccess(),
                        ),
                      );
                    }
                    if (state is StripePaymentFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                    }
                  },
                  builder: (context, state) {
                    return CustomButtonToCheckout(
                      onTap: () {
                        BlocProvider.of<StripePaymentCubit>(
                          context,
                        ).makePayment(
                          paymentIntentInputModel: PaymentIntentInputModel(
                            amount: (171 * 100).toInt(),
                            currency: 'USD',
                            customerId: 'cus_TQgvp95sdpS1jE',
                          ),
                        );
                      },
                      text: 'Pay',
                      isLoading: state is StripePaymentLoading ? true : false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
