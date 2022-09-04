import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart({Key? key, required this.data}) : super(key: key);
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.width * 0.18,
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
