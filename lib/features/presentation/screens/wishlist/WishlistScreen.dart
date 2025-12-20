import 'package:zimro/features/presentation/screens/wishlist/EmptyCartScreen.dart';
import 'package:zimro/features/presentation/screens/wishlist/wishListAdd.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, dynamic>> wishlistItems = [
    {
      'image': 'assets/modelGirl1.png',
      'text': 'Women Bottoms Free sizes',
      'price': '\$12.99',
      'rating': 5,
    },
    {
      'image': 'assets/modelGirl2.png',
      'text': 'Classic Women Pants',
      'price': '\$14.50',
      'rating': 4,
    },
    {
      'image': 'assets/modelGirl3.png',
      'text': 'Casual Top for Women',
      'price': '\$9.99',
      'rating': 3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: wishlistItems.isNotEmpty
          ? WishListAdd(items: wishlistItems)
          : EmptyCartScreen(size: size),
    );
  }
}
