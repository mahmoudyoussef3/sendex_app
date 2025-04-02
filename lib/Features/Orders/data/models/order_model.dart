import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.orderId,
    required super.customerFirstName,
    required super.customerLastName,
    required super.orderStatus,
    required super.orderPrice,
    required super.avatar,
    required super.product,
    required super.address,
    required super.email,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['id'],
      customerFirstName: json['first_name'],
      customerLastName: json['last_name'],
      orderStatus: json['status'],
      orderPrice: json['order_price'].toDouble(),
      avatar: json['avatat'],
      product: json['order'],
      address: json['address'],
      email: json['email'],
    );
  }
}
