import 'package:flutter/material.dart';
import 'package:personal_finance_tracker_app/provider/expense_provider.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Other'
  ];

  AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              items: categories.map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final expense = Expense(
                  amount: double.parse(_amountController.text),
                  description: _descriptionController.text,
                  category: categories[0],
                );
                Provider.of<ExpenseProvider>(context, listen: false)
                    .addExpense(expense);
                Navigator.pop(context);
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
