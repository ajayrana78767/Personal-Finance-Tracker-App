import 'package:flutter/material.dart';
import 'package:personal_finance_tracker_app/provider/expense_provider.dart';
import 'package:personal_finance_tracker_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseProvider(),
      child: MaterialApp(
        title: 'Personal Finance Tracker',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
