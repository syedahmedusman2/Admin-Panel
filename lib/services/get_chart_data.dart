import 'package:adminpanel/model/chart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ChartModel> getChartData() async {
  CollectionReference _firestore =
      FirebaseFirestore.instance.collection("users");
}
