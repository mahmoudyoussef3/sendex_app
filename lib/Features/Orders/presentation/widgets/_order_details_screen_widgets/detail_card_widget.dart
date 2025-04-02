import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailCardWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      margin:  EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.indigo.shade700),
             SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style:  TextStyle(fontSize: 14.sp, color: Colors.grey)),
                   SizedBox(height: 4.h),
                  Text(value, style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
