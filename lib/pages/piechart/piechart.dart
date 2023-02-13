import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:pie_chart/pie_chart.dart';

class PieChartPage extends StatelessWidget {
  final double totalExpense;
  final double totalIncome;
  const PieChartPage(
      {Key? key, required this.totalExpense, required this.totalIncome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController controller = HomeController();
    // var totalIncome = controller.totalIncome as double;
    // var expenseNo = controller.expenseNo as double;

    Map<String, double> dataMap = {
      "Income": totalIncome,
      "Expense": totalExpense,
      "None": 0
    };

    List<Color> colors = [
      Colors.teal,
      Colors.redAccent,
      Colors.grey,
    ];
    return pie.PieChart(
      dataMap: dataMap,
      colorList: colors,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 30,

      // centerText: "Finance",
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
