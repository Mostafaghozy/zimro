import 'package:zimro/features/presentation/widgets/CartNotificationBottomSheet.dart';
import 'package:zimro/features/presentation/widgets/home/CustomListView.dart';
import 'package:zimro/features/presentation/widgets/home/GridViewVertical.dart';
import 'package:zimro/features/presentation/widgets/home/appbarCustomWidget.dart';
import 'package:zimro/features/presentation/widgets/home/GridViewHorizontal.dart';

import 'package:zimro/features/presentation/widgets/category/category_item.dart';
import 'package:zimro/features/presentation/widgets/category/category_list.dart';
import 'package:zimro/features/presentation/widgets/search/section_title.dart';
import 'package:zimro/features/presentation/widgets/home/sort_filter_bar.dart';
import 'package:zimro/features/presentation/screens/home/Root.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key, List<String>? images})
    : images = images ?? kCategoryDefaultImages;

  final List<String> images;

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  void addToCart(String productName) {
    // Here you can add your cart logic
    // For now, we'll just show the notification
    CartNotificationBottomSheet.show(
      context,
      productName: productName,
      onViewCart: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RootScreen(initialIndex: 2)),
          (route) => false,
        );
      },
      onCheckOrder: () {
        // Navigate to orders or profile screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check order functionality')),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(8),
                const SectionTitle(title: 'Categories'),
                Gap(8),
                CategoryList(
                  images: widget.images,
                  labels: kCategories,
                  initialIndex: 0,
                  onSelected: (index) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selected category: ${kCategories[index]}',
                        ),
                      ),
                    );
                  },
                ),
                Gap(18),

                const SectionTitle(title: 'Trending clothes'),
                Gap(8),
                CustomListView(),

                const SizedBox(height: 18),

                const SectionTitle(title: 'New arrivals'),
                const SizedBox(height: 8),
                HorizontalProductCardList(
                  image: 'assets/girl_h1.png',
                  text: 'Cotton long sleve jacket',
                  title: 'Women’s wear',
                  price: '26.55',
                ),

                Gap(15),

                const SectionTitle(title: 'Top sale products'),
                Gap(8),
                CustomListView(),

                const SectionTitle(title: 'Summer collection'),
                GridViewAllProduct(),

                Gap(20),
                SortFilterBar(
                  onSort: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Sort tapped'))),
                  onFilter: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filter tapped')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
