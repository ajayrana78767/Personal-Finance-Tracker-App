import 'package:flutter/material.dart';
import 'package:personal_finance_tracker_app/screens/add_expense_screen.dart';
import 'package:personal_finance_tracker_app/screens/expense_chart.dart';
// import 'package:personal_finance_tracker_app/screens/expense_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Overview'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ExpenseChart(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExpenseScreen()),
                );
              },
              child: const Text('Add Expense'),
            ),
          ),
        ],
      ),
    );
  }
}
