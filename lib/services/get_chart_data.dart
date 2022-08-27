import 'package:adminpanel/model/chart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getChartData() async {
  List yearOfJoining = [];
  List<Map<String, dynamic>> chartData = [];
  await FirebaseFirestore.instance
      .collection('Users Info')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      yearOfJoining.add(DateTime.parse(doc['Date']).year);
      chartData.add({
        "domain": DateTime.parse(doc['Date']).year.toString(),
        "measure": 5
      });
    });
  });
  Map<int, int> count = {};
  yearOfJoining.forEach((i) => count[i] = (count[i] ?? 0) + 1);
  count.forEach((key, value) {
    chartData.add({'domain': key.toString(), 'measure': value});
  });
  return chartData;
}
