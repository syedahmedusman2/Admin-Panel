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
            'id': 'Line',
            'data': data,
          },
          {
            'id': 'Line2',
            'data': [
              {'domain': 1, 'measure': 10},
              {'domain': 2, 'measure': 20},
              {'domain': 3, 'measure': 30},
              {'domain': 4, 'measure': 40},
              {'domain': 5, 'measure': 50},
              {'domain': 6, 'measure': 60},
              {'domain': 7, 'measure': 70},
              {'domain': 8, 'measure': 80},
              {'domain': 9, 'measure': 90},
              {'domain': 10, 'measure': 100},
            ],
          }
        ],
        lineColor: (lineData, index, id) => Colors.green,
      ),
    );
  }
}
