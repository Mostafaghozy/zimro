import 'package:flutter/material.dart';

class RecentSearchWidget extends StatelessWidget {
  RecentSearchWidget({super.key});
  final List recent = [
    "Silk sarees",
    "Silk sarees",
    "Women’s denims",
    "Shorts",
    "Party dresses",
    "long sleve",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, //space horizontally between items
      runSpacing: 8, //space vertically between items
      children: List.generate(recent.length, (index) {
        return Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            recent[index],
            style: TextStyle(fontSize: 15, color: Colors.white54),
          ),
        );
      }),
    );
  }
}
