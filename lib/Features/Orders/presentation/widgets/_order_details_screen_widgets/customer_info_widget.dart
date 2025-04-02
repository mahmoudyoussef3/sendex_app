import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInfoWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  const CustomerInfoWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$firstName $lastName',
          style:  TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style:  TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
