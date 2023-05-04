import 'package:finance_app/models/expense_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

int balance = 0;

final box = Hive.box<ExpenseData>('data');

int getCurrentBalance() {
  var history2 = box.values.toList();
  var array = [0, 0]; // avoid exception with reduce function
  for (var i = 0; i < history2.length; i++) {
    var amtVal = int.parse(history2[i].amount!);
    array.add(history2[i].IN == 'Income' ? amtVal : -amtVal);
  }
  balance = array.reduce((value, element) => value + element);
  // current balance
  return balance;
}

int getCurrentIncome() {
  var history2 = box.values.toList();
  var array = [0, 0]; // avoid exception with reduce function
  for (var i = 0; i < history2.length; i++) {
    var amtVal = int.parse(history2[i].amount!);
    array.add(history2[i].IN == 'Income' ? amtVal : 0);
  }
  balance = array.reduce((value, element) => value + element);
  // current balance
  return balance;
}

int getCurrentExpense() {
  var history2 = box.values.toList();
  var array = [0, 0]; // avoid exception with reduce function
  for (var i = 0; i < history2.length; i++) {
    var amtVal = int.parse(history2[i].amount!);
    array.add(history2[i].IN == 'Income' ? 0 : -amtVal);
  }
  balance = array.reduce((value, element) => value + element);
  // current balance
  return balance;
}
