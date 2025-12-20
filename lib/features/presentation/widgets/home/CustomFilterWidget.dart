import 'package:zimro/features/presentation/widgets/home/CollectionsFilterBar.dart';
import 'package:zimro/features/presentation/widgets/home/HomeFilterSheet.dart';
import 'package:flutter/material.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CollectionsFilterBar(),
        Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) => const HomeFilterSheet(), //filterSheet
            );
          },
          child: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
