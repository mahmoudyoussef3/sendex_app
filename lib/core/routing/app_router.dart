import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex_app/Features/Orders/data/data_sources/order_data_source.dart';
import 'package:sendex_app/Features/Orders/data/repositories/order_repo_impl.dart';
import 'package:sendex_app/Features/Orders/domain/usecases/get_order_usecase.dart';
import 'package:sendex_app/Features/Orders/presentation/cubit/order_cubit.dart';
import '../../Features/Auth/presentation/cubit/login_cubit.dart';
import '../../Features/Auth/presentation/screens/login.dart';
import '../../Features/Orders/presentation/screens/orders.dart';
import '../utils/strings.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Strings.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: LoginScreen(),
                ));
      case Strings.ordersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OrderCubit(GetOrdersUseCase(
                      OrderRepositoryImpl(OrderDataSourceImpl()))),
                  child: const OrdersScreen(),
                ));


      default:
        return MaterialPageRoute(builder: (_) => const Text("No route"));
    }
  }
}
