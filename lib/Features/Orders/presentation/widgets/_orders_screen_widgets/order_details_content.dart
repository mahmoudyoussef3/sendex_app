import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  final String customerName;
  final String address;
  final String product;
  const OrderDetails({
    super.key,
    required this.customerName,
    required this.address,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(customerName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
        SizedBox(height: 5.h),
        _buildInfoRow(Icons.location_on, address),
        SizedBox(height: 5.h),
        _buildInfoRow(Icons.shopping_cart, product),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        SizedBox(width: 5.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
