import 'package:flutter/material.dart';
import 'package:zimro/features/presentation/widgets/payment/CardActionSheet.dart';
import 'package:gap/gap.dart';

class PaymentMethodCard extends StatelessWidget {
  final String logo;
  final String cardType;
  final String maskedNumber;
  final String expiry;
  final bool isDefault;
  final VoidCallback onSelect;
  final VoidCallback? onDelete;

  const PaymentMethodCard({
    super.key,
    required this.logo,
    required this.cardType,
    required this.maskedNumber,
    required this.expiry,
    this.isDefault = false,
    required this.onSelect,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 2),
        ),
      ),
      child: Row(
        children: [
          // Logo box
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(logo, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 12),

          // Card details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                maskedNumber,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                expiry,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          const Spacer(),

          Column(
            children: [
              if (isDefault) ...[
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white70, width: 0.5),
                  ),
                  child: const Text(
                    'Default',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
              Gap(10),
              IconButton(
                icon: const Icon(
                  Icons.expand_more_rounded,
                  color: Colors.white70,
                  size: 30,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: const Color.fromARGB(230, 25, 25, 27),
                    builder: (ctx) => CardActionSheet(
                      cardType: cardType,
                      maskedNumber: maskedNumber,
                      isDefault: isDefault,
                      onSetDefault: onSelect,
                      onDelete: onDelete ?? () {},
                    ),
                  );
                },
              ),
            ],
          ),

          // More options icon for all cards
        ],
      ),
    );
  }
}
