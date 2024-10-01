import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_tracker_app/screens/charts_screen.dart';
import 'package:personal_finance_tracker_app/screens/profile_screen.dart';
import 'package:personal_finance_tracker_app/screens/home_screen.dart';
import 'package:personal_finance_tracker_app/screens/add_expense_screen.dart';
import 'package:personal_finance_tracker_app/screens/view_expenses_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isNavBarVisible = false;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ViewExpensesScreen(),
    const ChartsScreen(),
    const ProfileScreen(),
  ];

  // Define icon list for bottom navigation items
  final iconList = <IconData>[
    Icons.home,
    Icons.list,
    Icons.pie_chart,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();

    // Delay the appearance of the navigation bar
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isNavBarVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This will change the screen based on the selected tab
      body: _screens[_currentIndex],

      // Central Floating Action Button for adding expenses
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        },
        child: const Icon(Icons.add, size: 30),
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Animated Bottom Navigation Bar
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            0, _isNavBarVisible ? 0 : 100, 0), // Slide up from the bottom
        child: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: _currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
