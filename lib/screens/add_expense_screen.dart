import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory;
  final List<String> _categories = ['Food', 'Transport', 'Shopping', 'Other'];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue; // Define a primary color
    final Color backgroundColor =
        Colors.blue[50]!; // Lighter shade for the background

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryColor, // Set app bar color
      ),
      body: Container(
        color: backgroundColor, // Set body background color
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Amount Field with a unique style
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      prefixIcon: const Icon(Icons.attach_money),
                      labelStyle: const TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Category Dropdown with a custom border
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      prefixIcon: const Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    value: _selectedCategory,
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Description Field (optional) with unique text field style
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Description (optional)',
                      prefixIcon: const Icon(Icons.description),
                      labelStyle: const TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.purple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Date Picker with a unique field style
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: _selectedDate == null
                          ? 'Select Date'
                          : 'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                      prefixIcon: const Icon(Icons.calendar_today),
                      labelStyle: const TextStyle(color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide:
                            const BorderSide(color: Colors.orange, width: 2),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: _pickDate,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Receipt Upload Button with an icon
                  ElevatedButton.icon(
                    onPressed: _uploadReceipt,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Upload Receipt'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Save Button with full width
                  ElevatedButton(
                    onPressed: _saveExpense,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Save Expense'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to pick the date
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Function to handle receipt upload (dummy function for now)
  void _uploadReceipt() {
    // Handle receipt upload logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receipt Upload Coming Soon')),
    );
  }

  // Function to save the expense
  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      // Save logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense Saved')),
      );
    }
  }
}
