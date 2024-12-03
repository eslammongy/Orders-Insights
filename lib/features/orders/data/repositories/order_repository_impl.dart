import 'package:dartz/dartz.dart';
import 'package:orders_metric/features/orders/data/datasource/order_data_source.dart';
import 'package:orders_metric/features/orders/data/models/order_model.dart';
import 'package:orders_metric/features/orders/domain/entities/order.dart';
import 'package:orders_metric/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;
  const OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<Either<Exception, List<OrderEntity>>> fetchAllOrders() async {
    try {
      final jsonResult = await orderDataSource.fetchOrdersFromFile();
      final orders =
          jsonResult.map((order) => OrderModel.fromJson(order)).toList();
      return right(orders);
    } catch (exp) {
      final expMsg = exp.toString();
      return left(Exception(expMsg));
    }
  }
}
