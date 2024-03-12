import "package:uuid/uuid.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

const uuid = Uuid();

final formatter = DateFormat.yMEd();

enum Category {
  food,
  transportation,
  entertainment,
  health,
  utilities,
  other,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.transportation: Icons.flight_takeoff,
  Category.entertainment: Icons.movie,
  Category.health: Icons.healing,
  Category.utilities: Icons.lightbulb_outline,
  Category.other: Icons.question_mark_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get FormattedDate => formatter.format(date);
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category):expenses = allExpenses.where((element) => element.category==category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
