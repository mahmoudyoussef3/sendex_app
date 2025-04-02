class OrderEntity {
  final num orderId;
  final String customerFirstName;
  final String customerLastName;
  final String orderStatus;
  final double orderPrice;
  final String avatar;
  final String product;
  final String address;
  final String email;

  OrderEntity({
    required this.orderId,
    required this.customerFirstName,
    required this.customerLastName,
    required this.orderStatus,
    required this.orderPrice,
    required this.avatar,
    required this.product,
    required this.address,
    required this.email,
  });

}
