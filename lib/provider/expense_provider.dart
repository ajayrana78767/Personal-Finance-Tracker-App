import 'package:flutter/foundation.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
}

class Expense {
  final double amount;
  final String description;
  final String category;

  Expense(
      {required this.amount,
      required this.description,
      required this.category});
}
