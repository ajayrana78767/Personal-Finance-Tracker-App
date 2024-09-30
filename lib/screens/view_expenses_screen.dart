import 'package:flutter/material.dart';

class ViewExpensesScreen extends StatelessWidget {
  const ViewExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        
        title: const Text('View Expenses'),
      ),
      body: ListView.builder(
        itemCount: 10, // Dummy item count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Expense #$index'),
            subtitle: const Text('Category: Food'),
            trailing: Text('\$${index * 10}'),
            onTap: () {
              // Handle expense click
            },
          );
        },
      ),
    );
  }
}
