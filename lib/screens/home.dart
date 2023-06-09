import 'package:finance_app/models/expense_data.dart';
import 'package:finance_app/utils/greeting.dart';
import 'package:finance_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final box = Hive.box<ExpenseData>('data');
  var history;
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'Friday',
    'Saturday',
    'Sunday'
  ];

  Widget _buildHeader(double screenHeight, double screenWidth) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.28,
              decoration: const BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buildGreeting(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 224, 223, 223),
                          ),
                        ),
                        const Text(
                          'Tuan Vu',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        color: const Color.fromRGBO(250, 250, 250, 0.1),
                        child: const Icon(
                          Icons.notification_add_outlined,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: screenHeight * 0.28 * 0.7,
          left: screenWidth * 0.13,
          child: Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.74,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 47, 125, 121),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(47, 125, 121, 0.3),
                  offset: Offset(0, 6),
                  blurRadius: 7.5,
                  spreadRadius: 4.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 5.0),

                  // Total money
                  Text(
                    '\$ ${getCurrentBalance()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),

                  // Income & Expense
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Income',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.remove_circle_outline_sharp,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Expense',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  // Income & Expense
                  const SizedBox(height: 6.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${getCurrentIncome()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$ ${getCurrentExpense()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: screenHeight * (0.28 * 0.7 + 0.2),
                    child: _buildHeader(screenHeight, screenWidth),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Transaction History',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    // childCount: transactions.length,
                    childCount: box.length,
                    (context, index) {
                      history = box.values.toList()[index];
                      return getList(history);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget getList(ExpenseData history) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
      },
      child: getListTile(history),
    );
  }

  ListTile getListTile(ExpenseData history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          'assets/images/${history.name}.jpg',
          height: 65.0,
          width: 65.0,
        ),
      ),
      title: Text(
        // transactions[index].name!,
        history.name!,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        // transactions[index].time!,
        '${day[history.dateTime!.weekday - 1]}  ${history.dateTime!.year}-${history.dateTime!.day}-${history.dateTime!.month}',
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        // transactions[index].buy == true
        //     ? "- ${transactions[index].fee!}"
        //     : "+ ${transactions[index].fee!}",
        history.amount!,
        style: TextStyle(
          // color: transactions[index].buy == true ? Colors.red : Colors.green,
          color: history.IN == 'Income' ? Colors.green : Colors.red,
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
