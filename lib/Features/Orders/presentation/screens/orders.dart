import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/order_cubit.dart';
import '../widgets/_orders_screen_widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderCubit>(context).fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.indigo));
            } else if (state is OrdersLoaded) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) =>
                    OrderCard(order: state.orders[index]),
              );
            } else if (state is OrdersError) {
              return Center(
                  child: Text(state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 16)));
            }
            return const Center(
                child: Text('No orders available',
                    style: TextStyle(fontSize: 16)));
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      foregroundColor: Colors.transparent,
      title: const Text('Orders',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.indigo.shade700,
      elevation: 2,
    );
  }
}
