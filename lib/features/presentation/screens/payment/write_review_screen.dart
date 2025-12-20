import 'package:zimro/features/presentation/widgets/review/CustomTextFormField.dart';
import 'package:zimro/features/presentation/widgets/review/review_action_buttons.dart';
import 'package:zimro/features/presentation/widgets/review/review_rating.dart';
import 'package:zimro/features/presentation/widgets/review/review_service.dart';

import 'package:flutter/material.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 1;
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    ReviewService.submitReview(
      context,
      _formKey,
      name: _nameController.text,
      email: _emailController.text,
      message: _messageController.text,
      rating: _rating,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white60),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Write a review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Rate the product',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ReviewRating(
                      rating: _rating,
                      onRatingChanged: (v) => setState(() => _rating = v),
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      messageController: _messageController,
                    ),
                  ],
                ),
              ),
            ),
            // Extracted buttons
            ReviewActionButtons(
              onSubmit: _submit,
              onCancel: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
