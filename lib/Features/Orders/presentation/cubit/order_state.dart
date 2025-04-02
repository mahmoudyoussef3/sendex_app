part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
class OrdersLoading extends OrderState {}
class OrdersLoaded extends OrderState {
  final List<OrderEntity> orders;
  OrdersLoaded(this.orders);
}
class OrdersError extends OrderState {
  final String message;
  OrdersError(this.message);
}
