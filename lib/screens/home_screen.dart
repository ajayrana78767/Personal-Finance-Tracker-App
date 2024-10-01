// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello, John', style: TextStyle(fontSize: 20)),
            Text('Today: ${DateTime.now().toString().substring(0, 10)}',
                style: const TextStyle(fontSize: 14)),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
