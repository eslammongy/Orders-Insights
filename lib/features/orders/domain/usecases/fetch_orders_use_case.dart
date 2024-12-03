import 'package:dartz/dartz.dart';
import 'package:orders_metric/features/orders/domain/entities/order.dart';
import 'package:orders_metric/features/orders/domain/repositories/order_repository.dart';

class FetchOrdersUseCase {
  final OrderRepository ordersRepository;

  FetchOrdersUseCase({required this.ordersRepository});

  Future<Either<Exception, List<OrderEntity>>> call() async =>
      await ordersRepository.fetchAllOrders();
}
