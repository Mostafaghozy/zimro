import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HorizontalProductCardList extends StatelessWidget {
  const HorizontalProductCardList({
    super.key,
    required this.image,
    required this.text,
    required this.title,
    required this.price,
  });
  final String image, text, title, price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.4,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(image, width: 100, height: 100),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(5),
                    Text(
                      title,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Gap(10),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
