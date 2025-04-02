import 'package:flutter/material.dart';
import 'package:sendex_app/Features/Orders/domain/entities/order_entity.dart';
import '../widgets/_order_details_screen_widgets/avatar_widget.dart';
import '../widgets/_order_details_screen_widgets/customer_info_widget.dart';
import '../widgets/_order_details_screen_widgets/detail_card_widget.dart';
import '../widgets/_order_details_screen_widgets/status_badge_widget.dart';
import '../widgets/_order_details_screen_widgets/status_button_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.orderEntity});
  final OrderEntity orderEntity;

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late String _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.orderEntity.orderStatus;
  }

  void _updateStatus(String newStatus) {
    setState(() {
      _currentStatus = newStatus;
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        'Order status updated successfully to $newStatus',
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Order Details', style: _appBarTextStyle),
        backgroundColor: Colors.indigo.shade700,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarWidget(avatarUrl: widget.orderEntity.avatar),
            const SizedBox(height: 16),
            CustomerInfoWidget(
              firstName: widget.orderEntity.customerFirstName,
              lastName: widget.orderEntity.customerLastName,
              email: widget.orderEntity.email,
            ),
            const SizedBox(height: 20),
            DetailCardWidget(
              icon: Icons.location_on,
              label: 'Address',
              value: widget.orderEntity.address,
            ),
            DetailCardWidget(
              icon: Icons.shopping_cart,
              label: 'Product',
              value: widget.orderEntity.product,
            ),
            DetailCardWidget(
              icon: Icons.attach_money,
              label: 'Price',
              value: '\$${widget.orderEntity.orderPrice.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 30),
            StatusBadge(status: _currentStatus),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatusButtonWidget(
                  status: "Shipped",
                  color: Colors.blue,
                  isSelected: _currentStatus == "Shipped",
                  onPressed: () => _updateStatus("Shipped"),
                ),
                const SizedBox(width: 16),
                StatusButtonWidget(
                  status: "Delivered",
                  color: Colors.green,
                  isSelected: _currentStatus == "Delivered",
                  onPressed: () => _updateStatus("Delivered"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const TextStyle _appBarTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
