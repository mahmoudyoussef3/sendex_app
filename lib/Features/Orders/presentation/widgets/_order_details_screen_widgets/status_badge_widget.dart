import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.w),
      decoration: BoxDecoration(
        color: _getStatusColor(status),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
              color: _getStatusColor(status).withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2),
        ],
      ),
      child: Text(
        status.toUpperCase(),
        style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Colors.green;
      case 'shipped':
        return Colors.blue;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
