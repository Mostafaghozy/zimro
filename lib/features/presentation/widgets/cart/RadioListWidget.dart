import 'package:flutter/material.dart';

class PaymentSelectionScreen extends StatefulWidget {
  const PaymentSelectionScreen({super.key});

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

enum PaymentCard { card1, card2, newCard }

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  PaymentCard? _selectedCard = PaymentCard.newCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<PaymentCard>(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: EdgeInsets.zero,
          title: const Text(
            '**** 3245',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: PaymentCard.card1,

          groupValue: _selectedCard,
          onChanged: (PaymentCard? value) {
            setState(() {
              _selectedCard = value;
            });
          },

          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellow[600]!;
            }
            return Colors.yellow;
          }),
        ),

        RadioListTile<PaymentCard>(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: EdgeInsets.zero,
          title: const Text(
            '**** 1397',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: PaymentCard.card2,
          groupValue: _selectedCard,
          onChanged: (PaymentCard? value) {
            setState(() {
              _selectedCard = value;
            });
          },

          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellow[600]!;
            }
            return Colors.yellow;
          }),
        ),

        RadioListTile<PaymentCard>(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'New card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: PaymentCard.newCard,
          groupValue: _selectedCard,
          onChanged: (PaymentCard? value) {
            setState(() {
              _selectedCard = value;
            });
          },

          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.yellow[600]!;
            }
            return Colors.yellow;
          }),
        ),
      ],
    );
  }
}
