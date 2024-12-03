import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_metric/core/constant/app_strings.dart';
import 'package:orders_metric/core/theme/text_style.dart';
import 'package:orders_metric/core/utils/helper.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders_metric/features/orders/presentation/views/widgets/graph_filter_component.dart';
import 'package:orders_metric/features/orders/presentation/views/widgets/orders_graph.dart';
import 'package:orders_metric/features/orders/presentation/views/widgets/orders_graph_dropdown.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 16,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildDropDownMenu(context),
        const SizedBox(height: 20),
        _buildGraphScreenMainBody(),
        SizedBox(
          height: kBottomNavigationBarHeight + 40,
        )
      ],
    );
  }

  Widget _buildDropDownMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.ordersFor,
            style: AppTextStyles.bold16(context),
          ),
          const SizedBox(width: 10),
          MonthsDropdownMenu(),
          const SizedBox(width: 10),
          GraphFilterComponent(),
        ],
      ),
    );
  }

  _buildGraphScreenMainBody() {
    return BlocBuilder<OrdersCubit, OrdersStatus>(
      builder: (context, state) {
        if (state is OrdersLoadedState) {
          return displayLoadingWidget(context);
        }
        if (state is OrdersLoadGraphState && state.graphData.isNotEmpty) {
          return OrdersGraph(
            graphData: state.graphData,
            totalOrders: state.totalOrders,
            maxHourlyOrders: state.maxHourlyOrders,
            minHourlyOrders: state.minHourlyOrders,
          );
        } else {
          return displayErrorWidget(
            context,
            errorMsg: AppStrings.monthlyEmptyOrders,
          );
        }
      },
    );
  }
}
