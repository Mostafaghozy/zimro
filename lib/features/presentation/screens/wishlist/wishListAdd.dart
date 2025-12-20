import 'package:zimro/features/presentation/widgets/wishList/ContainerWishList.dart';
import 'package:zimro/features/presentation/widgets/wishList/TopWishListWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishListAdd extends StatelessWidget {
  const WishListAdd({super.key, required this.items});

  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopWishListWidget(),
            const Gap(15),

            ...List.generate(items.length, (index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ContainerWishList(
                  image: item['image'],
                  text: item['text'],
                  price: item['price'],
                  rating: (item['rating'] as num).toDouble(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
