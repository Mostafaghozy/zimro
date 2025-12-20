import 'package:zimro/features/presentation/widgets/payment/TrackOrderWidget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomContainerDeliveryStatus extends StatelessWidget {
  const CustomContainerDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
      width: double.infinity,
      height: 430,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Track order",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "NYC1054C",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Gap(10),
          Divider(thickness: 1, color: Colors.grey.shade400),
          Gap(15),
          TrackOrderWidget(
            image: 'assets/icons/green_icon.png',
            title: 'Pick-up request accepted',
            subtitle: '9:10 AM, 19 June 2022',
          ),
          Gap(10),
          TrackOrderWidget(
            image: 'assets/icons/orange_icon.png',
            title: 'Product picked & started journey',
            subtitle: '12:40 PM, 19 june 2022',
          ),
          Gap(10),
          TrackOrderWidget(
            image: 'assets/icons/gift.png',
            title: 'Dispatch in local warehouse',
            subtitle: '1:10 AM, 20 June 2022',
            color: const Color.fromARGB(255, 179, 150, 4),
          ),
          Gap(10),
          TrackOrderWidget(
            image: 'assets/icons/gray_Heart.png',
            title: 'parcel delivered!',
            subtitle: '05:30 AM, 20 june 2022',
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
