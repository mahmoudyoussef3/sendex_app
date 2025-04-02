import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginButton(
      {super.key, required this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          : Text("Login",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold)),
    );
  }
}
