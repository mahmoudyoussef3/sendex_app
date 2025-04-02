import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/get_order_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrdersUseCase getOrdersUseCase;

  OrderCubit(this.getOrdersUseCase) : super(OrderInitial());
  void fetchOrders() async {
    emit(OrdersLoading());
    try {
      final orders = await getOrdersUseCase();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }


}
