import 'package:zimro/features/presentation/widgets/cart/RowCart.dart';
import 'package:zimro/features/presentation/widgets/cart/quantityWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContainerOrderCart extends StatelessWidget {
  const ContainerOrderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,

      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.asset("assets/all_product/m.png"),
          ),
          Gap(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Women's",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Gap(10),
                Text(
                  "Original levi’s denim",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Gap(10),
                RowCart(),
                Gap(10),
                Text(
                  "\$82.99",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Gap(20),
                QuantityWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
