import 'package:zimro/features/presentation/screens/profile/GiveFeedbackScreen.dart';
import 'package:zimro/features/presentation/screens/profile/MyOrderScreen.dart';
import 'package:zimro/features/presentation/screens/profile/MyPaymentOption.dart';
import 'package:zimro/features/presentation/widgets/RowProfileWidget.dart';
import 'package:zimro/features/presentation/screens/profile/PersonInformation/personalInformationScreen.dart';
import 'package:zimro/features/presentation/screens/profile/address/addressBook.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Icon(
                Icons.close_rounded,
                color: Colors.grey.shade600,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/profile.png", width: 60),
              SizedBox(height: 10),
              Text(
                "Ashan Niroshana",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "Account Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              PersonalInformation(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),

              AddressBook(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              MyPaymentOption(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/bell.png',
                title: 'Notification',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "My Order",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/Heart.png',
                title: 'Wishlist',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              MyOrderScreen(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              ////////////////////////////////////////////////////////////
              Text(
                "Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/help-circle.png',
                title: 'Get help',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/activity.png',
                title: 'Order Tracking',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              GiveFeedbackScreen(),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
              Text(
                "Legal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              RowProfileWidget(
                imageAsset: 'assets/icons/Shield Done.png',
                title: 'Term & conditions',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 10),
              RowProfileWidget(
                imageAsset: 'assets/icons/shield.png',
                title: 'Privacy policy',
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.3)),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
