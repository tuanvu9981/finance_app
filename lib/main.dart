import 'package:finance_app/screens/page_with_btm_nav.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:finance_app/models/expense_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseDataAdapter());
  await Hive.openBox<ExpenseData>('data');
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageWithBtmNav(),
    );
  }
}
