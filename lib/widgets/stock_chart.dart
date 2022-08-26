import 'package:adminpanel/widgets/charts/pie_chart.dart';
import 'package:adminpanel/widgets/glass_morphism.dart';
import 'package:flutter/material.dart';

class StockChart extends StatefulWidget {
  const StockChart({ Key? key }) : super(key: key);

  @override
  State<StockChart> createState() => _StockChartState();
}

class _StockChartState extends State<StockChart> {
  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: 0.6,
      end: 0.7,
      child: PieChart(),
      
    );
  }
}