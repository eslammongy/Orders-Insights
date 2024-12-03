import 'package:flutter/material.dart';
import 'package:orders_metric/core/utils/helper.dart';
import 'package:orders_metric/features/home/widgets/bottom_nav_bar.dart';
import 'package:orders_metric/features/home/widgets/main_app_bar.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MainAppBar(),
      body: listOfScreens[_currentIndex],
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: _currentIndex,
        getCurrentIndex: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
