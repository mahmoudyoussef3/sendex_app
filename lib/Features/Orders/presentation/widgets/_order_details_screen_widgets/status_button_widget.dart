import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusButtonWidget extends StatelessWidget {
  final String status;
  final Color color;
  final bool isSelected;
  final VoidCallback onPressed;

  const StatusButtonWidget({
    super.key,
    required this.status,
    required this.color,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? color.withOpacity(1) : color,
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        elevation: isSelected ? 6 : 2,
      ),
      child: Text(
        "Mark as $status",
        style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
