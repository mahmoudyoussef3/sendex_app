import 'package:flutter/material.dart';
import '../../../domain/entities/order_entity.dart';
import 'order_avatar.dart';
import 'order_details_content.dart';
import 'orders_action.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OrderAvatar(imageUrl: order.avatar),
            const SizedBox(width: 12),
            Expanded(
              child: OrderDetails(
                customerName:
                    '${order.customerFirstName} ${order.customerLastName}',
                address: order.address,
                product: order.product,
              ),
            ),
            OrderActions(order: order),
          ],
        ),
      ),
    );
  }
}
