import 'package:dartz/dartz.dart';
import 'package:zimro/core/errors/failures.dart';
import 'package:zimro/features/data/models/stripe/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
