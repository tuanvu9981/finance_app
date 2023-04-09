import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  ChartState createState() => ChartState();
}

class ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
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
            ],
            xValueMapper: (datum, index) => datum.year,
            yValueMapper: (datum, index) => datum.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  final String year;
  final int sales;
  SalesData({required this.sales, required this.year});
}
