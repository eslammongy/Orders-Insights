import 'package:flutter/material.dart';
import 'package:orders_metric/core/theme/app_theme.dart';
import 'package:orders_metric/core/theme/text_style.dart';
import 'package:orders_metric/features/orders/presentation/cubit/orders_cubit.dart';

enum GraphFilter { hours, days }

class GraphFilterComponent extends StatefulWidget {
  const GraphFilterComponent({super.key});

  @override
  State<GraphFilterComponent> createState() => _GraphFilterComponentState();
}

class _GraphFilterComponentState extends State<GraphFilterComponent> {
  final List<bool> _isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ToggleButtons(
      direction: Axis.horizontal, // Set vertical orientation
      isSelected: _isSelected,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _isSelected.length; i++) {
            _isSelected[i] = i == index;
          }
        });
        OrdersCubit.get(context).graphFilter = GraphFilter.values[index];
        OrdersCubit.get(context).aggregateOrdersByMonth();
      },
      borderColor: theme.colorScheme.primary.withOpacity(0.6),
      selectedBorderColor: theme.colorScheme.primary.withOpacity(0.6),
      selectedColor: Colors.white,
      fillColor: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      borderWidth: 2,
      constraints: const BoxConstraints(
        minWidth: 55,
        minHeight: 35,
      ),
      children: [
        Text(
          GraphFilter.hours.name,
          style: AppTextStyles.regular14(context),
        ),
        Text(
          GraphFilter.days.name,
          style: AppTextStyles.regular14(context),
        ),
      ],
    );
  }
}
