import 'package:flutter/material.dart';
import 'package:orders_metric/core/constant/app_strings.dart';
import 'package:orders_metric/core/theme/app_theme.dart';
import 'package:orders_metric/core/utils/dependency_injection.dart';
import 'package:orders_metric/features/home/screen/adaptive_home_layout.dart';
import 'package:provider/provider.dart';

import 'core/utils/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          themeMode: themeNotifier.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: AdaptiveHomeLayout(),
        );
      },
    );
  }
}
