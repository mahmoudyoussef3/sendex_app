import 'package:flutter/material.dart';
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 5),
        _buildInfoRow(Icons.location_on, address),
        const SizedBox(height: 5),
        _buildInfoRow(Icons.shopping_cart, product),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
