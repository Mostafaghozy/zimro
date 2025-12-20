import 'package:flutter/material.dart';

class CollectionsFilterBar extends StatefulWidget {
  const CollectionsFilterBar({super.key});

  @override
  State<CollectionsFilterBar> createState() => _CollectionsFilterBarState();
}

class _CollectionsFilterBarState extends State<CollectionsFilterBar> {
  int selectedIndex = 0;

  final List filters = ["All collections", "Trousers", "Denims", "Short"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(filters.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Color.fromARGB(255, 147, 137, 50)
                    : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Text(
                filters[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.white54,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
