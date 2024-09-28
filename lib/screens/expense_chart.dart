import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_tracker_app/provider/expense_provider.dart';
import 'package:provider/provider.dart';

class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseProvider>(context).expenses;

    final Map<String, double> expenseMap = {};
    for (var expense in expenseData) {
      if (expenseMap.containsKey(expense.category)) {
        expenseMap[expense.category] =
            expenseMap[expense.category]! + expense.amount;
      } else {
        expenseMap[expense.category] = expense.amount;
      }
    }

    return PieChart(
      PieChartData(
        sections: expenseMap.entries.map((entry) {
          return PieChartSectionData(
            value: entry.value,
            title: entry.key,
            color: getCategoryColor(entry.key),
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          );
        }).toList(),
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }

  // Helper function to assign colors to categories
  Color getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.green;
      case 'Transport':
        return Colors.blue;
      case 'Entertainment':
        return Colors.purple;
      default:
        return Colors.orange;
    }
  }
}
