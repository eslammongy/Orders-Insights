import 'package:flutter/material.dart';
import 'package:orders_metric/core/constant/app_strings.dart';
import 'package:orders_metric/core/theme/text_style.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders_metric/features/orders/presentation/views/widgets/orders_metric_card.dart';

class OrderMetricsScreenBody extends StatelessWidget {
  const OrderMetricsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCubit = OrdersCubit.get(context);
    final metricsDetails = metricDetails(orderCubit.metrics);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.numericMetricForAllOrders,
            style: AppTextStyles.bold20(context),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: buildGridView(metricsDetails),
          ),
        ],
      ),
    );
  }

  GridView buildGridView(List<dynamic> metricsDetails) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 16,
      ),
      itemCount: metricsDetails.length,
      itemBuilder: (context, index) {
        final detail = metricsDetails[index];
        return OrdersMetricCard(
          label: detail['label'] as String,
          value: detail['value'] as String,
          icon: detail['icon'] as IconData,
        );
      },
      shrinkWrap: false,
    );
  }

  // Define metric details to dynamically generate widgets
  List metricDetails(Map metrics) {
    return [
      {
        'label': AppStrings.totalOrders,
        'value': "${metrics[MetricLabels.total] ?? 0}",
        'icon': Icons.shopping_cart,
      },
      {
        'label': AppStrings.averagePrice,
        'value': "${metrics[MetricLabels.average] ?? 0.0}",
        'icon': Icons.attach_money,
      },
      {
        'label': AppStrings.returnsOrders,
        'value': "${metrics[MetricLabels.returns] ?? 0}",
        'icon': Icons.undo,
      },
    ];
  }
}
