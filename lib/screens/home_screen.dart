// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:personal_finance_tracker_app/screens/add_expense_screen.dart';
import 'package:personal_finance_tracker_app/screens/charts_screen.dart';
import 'package:personal_finance_tracker_app/screens/profile_screen.dart';
import 'package:personal_finance_tracker_app/screens/view_expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index

  // Method to switch between screens
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of widgets to show based on the selected tab
  final List<Widget> _screens = [
    const HomeDashboard(), // Home Screen with dashboard content
    const AddExpenseScreen(), // Add Expense screen
    const ViewExpensesScreen(), // View Expenses screen
    const ChartsScreen(), // Charts screen
    const ProfileScreen(), // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text('Hello, John', style: TextStyle(fontSize: 20)),
      //       Text('Today: ${DateTime.now().toString().substring(0, 10)}',
      //           style: const TextStyle(fontSize: 14)),
      //     ],
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body:
          _screens[_selectedIndex], // Display the screen based on selected tab

      // Floating Action Button for Add Expense
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Expense'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Charts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex, // Highlight the selected tab
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Handle tab selection
      ),
    );
  }
}

// Separate widgets for each screen content

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryCard('Total Income', '\$5000'),
              _buildSummaryCard('Total Expenses', '\$3000'),
              _buildSummaryCard('Total Savings', '\$2000'),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                const Text('Expense Categories',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                Expanded(child: _buildPieChart()),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle "View All Expenses"
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('View All Expenses'),
          ),
        ],
      ),
    );
  }

  // Summary card and pie chart code remains the same
  Widget _buildSummaryCard(String title, String amount) {
    return Card(
      elevation: 4,
      child: Container(
        width: 110,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(amount,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: 'Food',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 30,
            title: 'Transport',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 20,
            title: 'Shopping',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.yellow,
            value: 10,
            title: 'Other',
            titleStyle: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 40,
      ),
    );
  }
}
