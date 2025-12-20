import 'package:zimro/features/presentation/widgets/home/HomeFilterSheet.dart';
import 'package:zimro/features/presentation/widgets/category/SortBySheet.dart';

import 'package:flutter/material.dart';

typedef VoidIntCallback = void Function();

class SortFilterBar extends StatelessWidget {
  const SortFilterBar({super.key, this.onSort, this.onFilter});

  final VoidIntCallback? onSort;
  final VoidIntCallback? onFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (ctx) => const SortBySheet(),
                );
              },
              child: Row(
                children: [
                  Image.asset('assets/icons/activity.png'),
                  const SizedBox(width: 10),
                  const Text('SORT BY'),
                ],
              ),
            ),
            const SizedBox(width: 150),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (ctx) => const HomeFilterSheet(), //filterSheet
                );
              },
              child: Row(
                children: [
                  Image.asset('assets/icons/filter.png'),
                  const SizedBox(width: 10),
                  const Text('FILTER'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
