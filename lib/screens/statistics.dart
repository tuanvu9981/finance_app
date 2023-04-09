import 'package:finance_app/models/transaction.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  StatisticsState createState() => StatisticsState();
}

class StatisticsState extends State<Statistics> {
  final times = ['Day', 'Week', 'Month', 'Year'];
  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                  const Chart(),
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
                    leading: Image.asset(
                      topTransactions[index].imageUrl!,
                      height: 45.0,
                      width: 45.0,
                    ),
                    title: Text(
                      topTransactions[index].name!,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      topTransactions[index].time!,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Text(
                      topTransactions[index].buy == true
                          ? "- ${topTransactions[index].fee!}"
                          : "+ ${topTransactions[index].fee!}",
                      style: TextStyle(
                        color: topTransactions[index].buy == true
                            ? Colors.red
                            : Colors.green,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                childCount: topTransactions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
