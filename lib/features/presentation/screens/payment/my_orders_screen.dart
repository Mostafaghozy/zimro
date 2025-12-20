import 'package:zimro/features/presentation/widgets/order/EmptyWidget.dart';
import 'package:zimro/features/presentation/widgets/order/buildFilterButton.dart';
import 'package:zimro/features/presentation/widgets/order/orderCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white54),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              // Filter row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BuildFilterButton(
                      text: 'All',
                      active: selectedFilter == 'All',
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'All';
                        });
                      },
                    ),
                    BuildFilterButton(
                      text: 'To pay',
                      active: selectedFilter == 'To pay',
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'To pay';
                        });
                      },
                    ),
                    BuildFilterButton(
                      text: 'To ship',
                      active: selectedFilter == 'To ship',
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'To ship';
                        });
                      },
                    ),
                    BuildFilterButton(
                      text: 'To receive',
                      active: selectedFilter == 'To receive',
                      onPressed: () {
                        setState(() {
                          selectedFilter = 'To receive';
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Divider(color: Color(0xFF222222)),
              const SizedBox(height: 12),

              // Main content
              Expanded(
                child: () {
                  if (selectedFilter == 'All') {
                    return const OrderCard();
                  } else if (selectedFilter == 'To pay') {
                    return const EmptyOrderWidget();
                  } else if (selectedFilter == 'To ship') {
                    return const OrderCard();
                  } else if (selectedFilter == 'To receive') {
                    return const EmptyOrderWidget();
                  } else {
                    return const EmptyOrderWidget();
                  }
                }(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
