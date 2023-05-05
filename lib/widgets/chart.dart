import 'package:finance_app/models/expense_data.dart';
import 'package:finance_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  int? index;
  Chart({Key? key, this.index}) : super(key: key);

  @override
  ChartState createState() => ChartState();
}

class ChartState extends State<Chart> {
  var array = <ExpenseData>[];
  var b = true;
  var j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        array = today();
        b = true;
        j = true;
        break;
      case 1:
        array = week();
        b = false;
        j = true;
        break;
      case 2:
        array = month();
        b = false;
        j = true;
        break;
      case 3:
        array = year();
        j = false;
        break;
      default:
    }
    return Container(
      width: double.infinity,
      height: 300.0,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries(
            width: 3.0,
            color: const Color.fromARGB(255, 47, 125, 121),
            dataSource: <SalesData>[
              SalesData(sales: 100, year: 'Mon'),
              SalesData(sales: 20, year: 'Tue'),
              SalesData(sales: 40, year: 'Wen'),
              SalesData(sales: 15, year: 'Sat'),
              SalesData(sales: 5, year: 'Sun'),
              // ...List.generate(time(array, b ? true : false).length, (index) {
              //   return SalesData(
              //     year: j
              //         ? b
              //             ? array[index].dateTime!.hour.toString()
              //             : array[index].dateTime!.day.toString()
              //         : array[index].dateTime!.month.toString(),
              //     sales: b
              //         ? index > 0
              //             ? time(array, true)[index] +
              //                 time(array, true)[index - 1]
              //             : time(array, true)[index]
              //         : index > 0
              //             ? time(array, false)[index] +
              //                 time(array, false)[index - 1]
              //             : time(array, false)[index],
              //   );
              // })
            ],
            xValueMapper: (data, index) => data.year,
            yValueMapper: (data, index) => data.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  final String year;
  final int sales;
  SalesData({required this.year, required this.sales});
}
