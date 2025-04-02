import 'package:flutter/material.dart';

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
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
