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

List<ExpenseData> today() {
  var array = <ExpenseData>[];
  var history2 = box.values.toList();
  DateTime dateTime = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dateTime!.day == dateTime.day) {
      array.add(history2[i]);
    }
  }
  return array;
}

List<ExpenseData> week() {
  var array = <ExpenseData>[];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].dateTime!.day &&
        history2[i].dateTime!.day <= date.day) {
      // history data is inside a week
      array.add(history2[i]);
    }
  }
  return array;
}

List<ExpenseData> month() {
  var array = <ExpenseData>[];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dateTime!.month == date.month &&
        history2[i].dateTime!.year == date.year) {
      array.add(history2[i]);
    }
  }
  return array;
}

List<ExpenseData> year() {
  var array = <ExpenseData>[];
  var history2 = box.values.toList();
  DateTime dateTime = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dateTime!.year == dateTime.year) {
      array.add(history2[i]);
    }
  }
  return array;
}

int totalChart(List<ExpenseData> history2) {
  List a = [0, 0];

  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Income'
        ? int.parse(history2[i].amount!)
        : int.parse(history2[i].amount!) * -1);
  }
  var totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<ExpenseData> history2, bool hour) {
  List<ExpenseData> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].dateTime!.hour == history2[c].dateTime!.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].dateTime!.day == history2[c].dateTime!.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(a));
    a.clear();
    c = counter;
  }
  return total;
}
