import 'package:zimro/features/presentation/screens/payment/write_review_screen.dart';
import 'package:zimro/features/presentation/widgets/RowProfileWidget.dart';
import 'package:flutter/material.dart';

class GiveFeedbackScreen extends StatelessWidget {
  const GiveFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RowProfileWidget(
      imageAsset: 'assets/icons/edit-3.png',
      title: 'Give us feedback',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WriteReviewScreen()),
        );
      },
    );
  }
}
