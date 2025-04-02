import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repo.dart';
import '../data_sources/order_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource dataSource;

  OrderRepositoryImpl(this.dataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
    return await dataSource.fetchOrders();
  }
}