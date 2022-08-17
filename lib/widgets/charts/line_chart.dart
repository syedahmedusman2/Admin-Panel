import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart(
      {Key? key, this.height = 300, this.width = 300, required this.data})
      : super(key: key);
  final double height;
  final double width;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: DChartLine(
        includePoints: true,
        data: [
          {
            'id': 'Line1',
            'data': data,
          },
          {
            'id': 'Line2',
            'data': data,
          }
        ],
        lineColor: (lineData, index, id) => Colors.green,
      ),
    );
  }
}
