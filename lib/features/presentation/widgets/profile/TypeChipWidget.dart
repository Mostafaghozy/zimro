import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TypeChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color defaultIconColor =
        Theme.of(context).iconTheme.color ?? Colors.grey;
    final Color defaultTextColor =
        Theme.of(context).textTheme.labelMedium?.color ?? Colors.grey;
    final Color activeColor = Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? Colors.white
                : Theme.of(context).dividerColor.withOpacity(0.6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              label == 'Home' ? Icons.home_filled : Icons.apartment_rounded,
              size: 16,
              color: selected ? activeColor : defaultIconColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? activeColor : defaultTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
