import 'package:get_it/get_it.dart';
import 'package:orders_metric/features/orders/data/datasource/order_data_source.dart';
import 'package:orders_metric/features/orders/domain/repositories/order_repository.dart';
import 'package:orders_metric/features/orders/domain/usecases/fetch_orders_use_case.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';

import '../../features/orders/data/repositories/order_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> initAppDependencies() async {
  getIt.registerLazySingleton<OrderDataSource>(
    () => OrderDataSource(),
  );
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(orderDataSource: getIt<OrderDataSource>()),
  );
  getIt.registerLazySingleton<FetchOrdersUseCase>(
    () => FetchOrdersUseCase(ordersRepository: getIt<OrderRepository>()),
  );

  getIt.registerFactory<OrdersCubit>(
    () => OrdersCubit(fetchOrdersUseCase: getIt<FetchOrdersUseCase>()),
  );
}
