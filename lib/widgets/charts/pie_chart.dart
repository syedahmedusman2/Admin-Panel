import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart({Key? key, this.data}) : super(key: key);
  final List<Map<String, dynamic>>? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      child: DChartPie(
        labelPosition: PieLabelPosition.outside,
        animate: true,
        data: [
          {'domain': "Flutter", 'measure': 20},
          {'domain': "Fluttera", 'measure': 25},
        ],
        pieLabel: (pieData, index) {
          return "${pieData['domain']}:\n${pieData['measure']}%";
        },
        fillColor: (pieData, index) {
          switch (index) {
            case 1:
              return Colors.blue;
            case 2:
              return Colors.red;
            case 3:
              return Colors.pink;
            default:
              return Colors.orange;
          }
        },
      ),
    );
  }
}

class PieChart2 extends StatelessWidget {
  const PieChart2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: DChartPie(
        data: [
          {'domain': 'Flutter', 'measure': 28},
          {'domain': 'React Native', 'measure': 27},
          {'domain': 'Ionic', 'measure': 20},
          {'domain': 'Cordova', 'measure': 15},
        ],
        fillColor: (pieData, index) => Colors.purple,
        donutWidth: 30,
        labelColor: Colors.white,
      ),
    );
  }
}
