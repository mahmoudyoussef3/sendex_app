import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/order_model.dart';

abstract class OrderDataSource {
  Future<List<OrderModel>> fetchOrders();
}

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<List<OrderModel>> fetchOrders() async {
    final response = await rootBundle.loadString('assets/users_order.json');
    final List<dynamic> data = json.decode(response);
    print(data.map((json) => OrderModel.fromJson(json)).toList());
    return data.map((json) => OrderModel.fromJson(json)).toList();
  }
}
