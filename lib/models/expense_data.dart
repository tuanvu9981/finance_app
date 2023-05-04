import 'package:hive/hive.dart';
part 'expense_data.g.dart';

@HiveType(typeId: 1)
class ExpenseData extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? amount;

  @HiveField(2)
  String? explain;

  @HiveField(3)
  String? IN;

  @HiveField(4)
  DateTime? dateTime;

  ExpenseData({
    this.IN,
    this.amount,
    this.dateTime,
    this.explain,
    this.name,
  });
}
