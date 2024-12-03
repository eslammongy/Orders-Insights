import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_metric/core/utils/helper.dart';
import 'package:orders_metric/features/home/widgets/main_app_bar.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';

class TabletHomeScreen extends StatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  State<TabletHomeScreen> createState() => _TabletHomeScreenState();
}

class _TabletHomeScreenState extends State<TabletHomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        getCurrentIndex: (index) {
          setState(() => _currentIndex = index);
        },
      ),
      body: BlocListener<OrdersCubit, OrdersStatus>(
        listener: (context, state) {
          if (state is OrdersLoadedState) {
            OrdersCubit.get(context).calculateMetrics(state.orders);
          }
        },
        child: listOfScreens[_currentIndex],
      ),
    );
  }
}
