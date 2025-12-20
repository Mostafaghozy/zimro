import 'package:dio/dio.dart';
import 'package:zimro/core/api_keys.dart';
import 'package:zimro/features/data/models/stripe/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:zimro/features/data/models/stripe/init_payment_sheet_input_model.dart';
import 'package:zimro/features/data/models/stripe/payment_intent_input_model.dart';
import 'package:zimro/features/data/models/stripe/payment_intent_model/payment_intent_model.dart';
import 'package:zimro/features/data/services/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //first step createPaymentIntent
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  //second step initPaymentSheet
  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: "Fashion",
      ),
    );
  }

  //third step displyPaymentSheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // makePayment
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );

    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {"customer": customerId},
      url: "https://api.stripe.com/v1/ephemeral_keys",
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.stripeSecretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.stripeSecretKey}",
        "Stripe-Version": "2025-07-30.basil",
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
