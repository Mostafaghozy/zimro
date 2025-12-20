import 'package:dartz/dartz.dart';
import 'package:zimro/core/errors/failures.dart';
import 'package:zimro/features/data/models/stripe/payment_intent_input_model.dart';
import 'package:zimro/features/data/repositories/checkout_repo.dart';
import 'package:zimro/features/data/services/stripe_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(
          errMessage: e.error.message ?? "Oops there was an error ",
        ),
      );
      // } catch (e) {
      //   return left(ServerFailure(errMessage: e.toString()));
      // }
    }
  }
}
