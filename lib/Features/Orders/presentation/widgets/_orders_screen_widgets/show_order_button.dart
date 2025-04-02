import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex_app/Features/Orders/domain/entities/order_entity.dart';
import 'package:sendex_app/Features/Orders/presentation/screens/order_details_screen.dart';


class ShowOrderButton extends StatelessWidget {
  const ShowOrderButton({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
              orderEntity: order,
            ),
          )),

      child: Container(
        width: 90.w,
        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: const Center(
          child: Text('Details',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
