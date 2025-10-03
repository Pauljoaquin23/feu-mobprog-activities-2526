import 'package:expense_app/expense/expense_list.dart';
import 'package:expense_app/expense/new_expense.dart';
import 'package:expense_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() {
    return _ExpenseScreenState();
  }
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Lunch sa Jollibe',
      amount: 300.49,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Team Building sa McDo',
      amount: 1500.34,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie Demon-Slayer',
      amount: 450.54,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense Deleted Successfully!'),
        action: SnackBarAction(label: 'Undo', onPressed: (){
          setState(() {
            registeredExpenses.insert(expenseIndex, expense);
          });
        }
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: registeredExpenses,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker', style: TextStyle(fontSize: 24)),
        actions: [
          IconButton(onPressed: openExpenseModal, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('Chart Area'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
