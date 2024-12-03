import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_metric/core/utils/helper.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders_metric/features/orders/presentation/views/widgets/metric_screen_body.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCubit = OrdersCubit.get(context);
    return BlocConsumer<OrdersCubit, OrdersStatus>(
      listener: (context, state) {
        if (state is OrdersLoadedState) {
          OrdersCubit.get(context).calculateMetrics(state.orders);
        }
      },
      builder: (context, state) {
        if (state is OrdersLoadedState || orderCubit.orders.isNotEmpty) {
          return OrderMetricsScreenBody();
        } else if (state is OrdersFailureState) {
          return displayErrorWidget(
            context,
            errorMsg: state.message,
          );
        } else {
          return displayLoadingWidget(context);
        }
      },
    );
  }
}
