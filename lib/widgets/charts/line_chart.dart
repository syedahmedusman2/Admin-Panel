import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart({Key? key, required this.data}) : super(key: key);
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: DChartLine(
        includePoints: true,
        data: [
          {
            'id': 'Line1',
            'data': data,
          },
        ],
        lineColor: (lineData, index, id) => Colors.green,
      ),
    );
  }
}
