import 'package:zimro/features/presentation/widgets/CartNotificationBottomSheet.dart';
import 'package:zimro/features/presentation/widgets/home/ContainerCustomWidget.dart';
import 'package:zimro/features/presentation/widgets/home/CustomListView.dart';
import 'package:zimro/features/presentation/widgets/home/GridViewVertical.dart';
import 'package:zimro/features/presentation/widgets/home/WelcomeHeader.dart';
import 'package:zimro/features/presentation/widgets/home/appbarCustomWidget.dart';
import 'package:zimro/features/presentation/widgets/home/GridViewHorizontal.dart';

import 'package:zimro/features/presentation/widgets/home/seeAllWidget.dart';
import 'package:zimro/features/presentation/screens/home/AllProductScreen.dart';
import 'package:zimro/features/presentation/screens/home/Root.dart';

import 'package:zimro/features/presentation/widgets/home/CustomFilterWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void addToCart(String productName) {
    // Show the cart notification
    CartNotificationBottomSheet.show(
      context,
      productName: productName,
      onViewCart: () {
        // Navigate to cart screen (index 2 in bottom nav)
        // We need to navigate to MainScreen and set the cart tab
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeHeader(),
                  Gap(10),
                  ContainerCustomWidget(),
                  Gap(10),
                  CustomFilterWidget(),
                  Gap(15),
                  seeAllWidget(text1: 'All collections', text2: 'See all'),
                  Gap(20),
                  CustomListView(),
                  Gap(20),
                  seeAllWidget(text1: 'New arrivals', text2: 'See all'),
                  Gap(20),
                  HorizontalProductCardList(
                    image: 'assets/girl_h1.png',
                    text: 'Cotton long sleve jacket',
                    title: 'Women’s wear',
                    price: '26.55',
                  ),
                  Gap(20),
                  seeAllWidget(
                    text1: 'All Product',
                    text2: 'See all',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllProductScreen(),
                        ),
                      );
                    },
                  ),
                  Gap(20),
                  GridViewAllProduct(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
