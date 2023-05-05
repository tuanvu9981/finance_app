import 'package:finance_app/models/expense_data.dart';
import 'package:finance_app/models/transaction.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:finance_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  StatisticsState createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  final times = ['Day', 'Week', 'Month', 'Year'];
  int indexColor = 0;
  final box = Hive.box<ExpenseData>('data');
  var funcs = [today(), week(), month(), year()];
  var array = <ExpenseData>[];
  ValueNotifier kj = ValueNotifier(0);
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (context, dynamic value, child) {
            array = funcs[value];
            return custom();
          },
        ),
      ),
    );
  }

  Widget custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexColor = index;
                          kj.value = index;
                        });
                      },
                      child: Container(
                        height: 40.0,
                        width: 72.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: indexColor == index
                              ? const Color.fromARGB(255, 47, 125, 121)
                              : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          times[index],
                          style: TextStyle(
                            color: indexColor == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120.0,
                    height: 40.0,
                    margin: const EdgeInsets.symmetric(horizontal: 12.5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Expense',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 17.5),
              Chart(index: indexColor),
              const SizedBox(height: 22.5),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 12.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25.0,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    'assets/images/${array[index].name}.jpg',
                    height: 65.0,
                    width: 65.0,
                  ),
                ),
                title: Text(
                  // topTransactions[index].name!,
                  array[index].name!,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  // topTransactions[index].time!,
                  '${day[array[index].dateTime!.weekday - 1]}  ${array[index].dateTime!.year}-${array[index].dateTime!.day}-${array[index].dateTime!.month}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  // transactions[index].buy == true
                  //     ? "- ${transactions[index].fee!}"
                  //     : "+ ${transactions[index].fee!}",
                  array[index].amount!,
                  style: TextStyle(
                    // color: transactions[index].buy == true ? Colors.red : Colors.green,
                    color:
                        array[index].IN == 'Income' ? Colors.green : Colors.red,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
            // childCount: topTransactions.length,
            childCount: array.length,
          ),
        ),
      ],
    );
  }
}
