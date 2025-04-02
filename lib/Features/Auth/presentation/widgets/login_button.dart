import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Colors.blueAccent,
            )
          : Text("Login",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
    );
  }
}
