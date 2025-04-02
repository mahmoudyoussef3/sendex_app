import 'package:flutter/material.dart';
import 'package:sendex_app/Features/Orders/domain/entities/order_entity.dart';
import 'package:sendex_app/Features/Orders/presentation/screens/order_details_screen.dart';

import '../../../../../core/utils/strings.dart';

class ShowOrderButton extends StatelessWidget {
  const ShowOrderButton({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(
              orderEntity: order,
            ),
          )),

      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text('Details',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
