import 'package:zimro/features/presentation/screens/cart/CartScreen.dart';
import 'package:zimro/features/presentation/screens/home/AllProductScreen.dart';
import 'package:zimro/features/presentation/screens/home/homeScreen.dart';
import 'package:zimro/features/presentation/screens/notification/NotificationScreen.dart';
import 'package:zimro/features/presentation/screens/search/SearchScreen.dart';
import 'package:zimro/features/presentation/screens/wishlist/WishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  final int initialIndex;
  const RootScreen({super.key, this.initialIndex = 0});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late int currentScreen;
  late PageController controller;

  final _homeNavigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    currentScreen = widget.initialIndex;
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Navigator(
            key: _homeNavigatorKey,
            onGenerateRoute: (settings) {
              if (settings.name == '/allProducts') {
                return MaterialPageRoute(
                  builder: (context) => const AllProductScreen(),
                );
              }
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
            },
          ),

          const SearchScreen(),

          const MyCartScreen(),

          const WishlistScreen(),

          const NotificationScreen(),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(204, 165, 161, 35),
          unselectedItemColor: Colors.white24,
          enableFeedback: false,

          selectedLabelStyle: const TextStyle(
            fontFamily: 'Jost-Bold.ttf',
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Jost',
            fontWeight: FontWeight.w200,
          ),

          currentIndex: currentScreen,
          onTap: (index) {
            if (index == currentScreen) {
              if (index == 0) {
                _homeNavigatorKey.currentState?.popUntil(
                  (route) => route.isFirst,
                );
              }
              return;
            }
            setState(() => currentScreen = index);
            controller.jumpToPage(currentScreen);
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              label: 'Notification',
            ),
          ],
        ),
      ),
    );
  }
}
