import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: isSelected ? 6 : 2,
      ),
      child: Text(
        "Mark as $status",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
