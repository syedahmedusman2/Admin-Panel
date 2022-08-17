import 'package:adminpanel/widgets/charts/bar_chart.dart';
import 'package:adminpanel/widgets/charts/line_chart.dart';
import 'package:adminpanel/widgets/charts/pie_chart.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: sidebarWidget(context, 'home'),
      body: SingleChildScrollView(
          child: Column(
        children: [
          PieChart(
            data: [
              {'domain': 'Case A', 'measure': 28},
              {'domain': 'Case B', 'measure': 27},
              {'domain': 'Case C', 'measure': 20},
              {'domain': 'Case D', 'measure': 15},
            ],
          ),
          SizedBox(
            height: 30,
          ),
          LineChart(
            data: [
              {'domain': 0, 'measure': 1},
              {'domain': 2, 'measure': 2},
              {'domain': 3, 'measure': 3},
              {'domain': 4, 'measure': 3},
              {'domain': 5, 'measure': 6},
              {'domain': 6, 'measure': 8},
              {'domain': 7, 'measure': 10},
            ],
          ),
          SizedBox(
            height: 30,
          ),
          BarChart(
            height: 300,
            width: 300,
            color: Colors.green,
            data: [
              {'domain': 'A', 'measure': 10},
              {'domain': 'B', 'measure': 20},
              {'domain': 'C', 'measure': 30},
              {'domain': 'D', 'measure': 40},
              {'domain': 'E', 'measure': 50},
              {'domain': 'F', 'measure': 60},
              {'domain': 'G', 'measure': 70},
              {'domain': 'H', 'measure': 80},
              {'domain': 'I', 'measure': 90},
              {'domain': 'J', 'measure': 100},
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      )),
    );
  }
}
