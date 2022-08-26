import 'dart:ui';

import 'package:adminpanel/widgets/charts/bar_chart.dart';
import 'package:adminpanel/widgets/charts/line_chart.dart';
import 'package:adminpanel/widgets/charts/pie_chart.dart';
import 'package:adminpanel/widgets/glass_morphism.dart';
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
          Text("HELLO WORLD"),
          BarChart(
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
          Form(
              child: GlassMorphism(
                  start: 0.6,
                  end: 0.7,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(padding: EdgeInsets.all(8.0), child: PieChart()),
                  ])))

          // Container(
          //   height: 200,
          //   width: 300,
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          //     child: Container(
          //       decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}
