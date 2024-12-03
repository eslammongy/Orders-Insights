import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders_metric/core/utils/dependency_injection.dart';
import 'package:orders_metric/features/orders/domain/usecases/fetch_orders_use_case.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';

import 'adaptive_layout.dart';
import 'desktop_home_screen.dart';
import 'mobile_home_screen.dart';
import 'tablet_home_screen.dart';

class AdaptiveHomeLayout extends StatelessWidget {
  const AdaptiveHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => buildBlocProvider(
        const MobileHomeScreen(),
      ),
      tabletLayout: (context) => buildBlocProvider(
        const TabletHomeScreen(),
      ),
      desktopLayout: (context) => buildBlocProvider(
        const DesktopHomeScreen(),
      ),
    );
  }

  buildBlocProvider(Widget child) {
    return BlocProvider(
      create: (context) => OrdersCubit(
        fetchOrdersUseCase: getIt<FetchOrdersUseCase>(),
      )..fetchAllOrders(),
      child: child,
    );
  }
}
