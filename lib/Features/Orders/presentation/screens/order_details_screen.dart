import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex_app/Features/Orders/domain/entities/order_entity.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import animation package
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
        title: Text('Order Details', style: _appBarTextStyle),
        backgroundColor: Colors.indigo.shade700,
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarWidget(avatarUrl: widget.orderEntity.avatar)
                .animate()
                .fadeIn(duration: 600.ms)
                .move(
                    delay: Duration(milliseconds: 1000),
                    duration: 800.ms,
                    curve: Curves.easeOut),
            SizedBox(height: 16.h),
            CustomerInfoWidget(
              firstName: widget.orderEntity.customerFirstName,
              lastName: widget.orderEntity.customerLastName,
              email: widget.orderEntity.email,
            )
                .animate()
                .fadeIn(duration: 700.ms)
                .move(delay: Duration(milliseconds: 1000), duration: 900.ms),
            SizedBox(height: 20.h),
            DetailCardWidget(
              icon: Icons.location_on,
              label: 'Address',
              value: widget.orderEntity.address,
            )
                .animate()
                .fadeIn(duration: 700.ms)
                .move(delay: Duration(milliseconds: 1000), duration: 900.ms),
            DetailCardWidget(
              icon: Icons.shopping_cart,
              label: 'Product',
              value: widget.orderEntity.product,
            )
                .animate()
                .fadeIn(duration: 800.ms)
                .move(delay: Duration(milliseconds: 1000), duration: 1000.ms),
            DetailCardWidget(
              icon: Icons.attach_money,
              label: 'Price',
              value: '\$${widget.orderEntity.orderPrice.toStringAsFixed(2)}',
            )
                .animate()
                .fadeIn(duration: 900.ms)
                .move(delay: Duration(milliseconds: 1000), duration: 1100.ms),
            SizedBox(height: 30.h),
            StatusBadge(status: _currentStatus)
                .animate()
                .fadeIn(duration: 1000.ms)
                .move(delay: Duration(milliseconds: 1000), duration: 1200.ms),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatusButtonWidget(
                  status: "Shipped",
                  color: Colors.blue,
                  isSelected: _currentStatus == "Shipped",
                  onPressed: () => _updateStatus("Shipped"),
                ).animate().scale(duration: 400.ms, curve: Curves.easeInOut),
                SizedBox(width: 16.w),
                StatusButtonWidget(
                  status: "Delivered",
                  color: Colors.green,
                  isSelected: _currentStatus == "Delivered",
                  onPressed: () => _updateStatus("Delivered"),
                ).animate().scale(duration: 400.ms, curve: Curves.easeInOut),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _appBarTextStyle = TextStyle(
  fontSize: 22.sp,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
