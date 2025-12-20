import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zimro/features/presentation/screens/profile/profileScreen.dart';

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: SizedBox(
          width: 140,
          height: 48,
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset('assets/zimro.svg'),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white60,
              child: Image.asset("assets/profile.png"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
