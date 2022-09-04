import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  BarChart(
      {Key? key,
      this.height = 300,
      this.width = 300,
      this.color = Colors.green,
      this.id = "bar1",
      required this.data})
      : super(key: key);
  final double height;
  final double width;
  final List<Map<String, dynamic>> data;
  final Color color;
  final id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.18,
      width: MediaQuery.of(context).size.width * 0.18,
      child: DChartBar(
        data: [
          {
            'id': 'Bar',
            'data': data,
          },
        ],
        minimumPaddingBetweenLabel: 1,
        domainLabelPaddingToAxisLine: 16,
        axisLineTick: 2,
        axisLinePointTick: 2,
        axisLinePointWidth: 10,
        axisLineColor: Colors.green,
        measureLabelPaddingToAxisLine: 16,
        barColor: (barData, index, id) => color,
        barValue: (barData, index) => '${barData['measure']}',
        showBarValue: true,
        barValueFontSize: 12,
        barValuePosition: BarValuePosition.outside,
      ),
    );
  }
}
