import 'package:flutter/material.dart';
import 'package:sendex_app/Features/Orders/domain/entities/order_entity.dart';
import 'package:sendex_app/Features/Orders/presentation/widgets/_orders_screen_widgets/show_order_button.dart';
import 'package:sendex_app/Features/Orders/presentation/widgets/_orders_screen_widgets/status_badge.dart';

class OrderActions extends StatelessWidget {
  final OrderEntity order;
  const OrderActions({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatusBadge(status: order.orderStatus),
        const SizedBox(height: 24),
        ShowOrderButton(
          order: order,
        ),
      ],
    );
  }
}
