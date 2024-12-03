import 'package:dartz/dartz.dart';
import 'package:orders_metric/features/orders/domain/entities/order.dart';

abstract class OrderRepository {
  /// Fetches all orders from the JSON file and returns a list of order entities.
  Future<Either<Exception, List<OrderEntity>>> fetchAllOrders();
}
