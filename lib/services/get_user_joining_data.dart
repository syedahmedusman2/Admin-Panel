import 'package:adminpanel/model/chart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getUserJoiningData() async {
  List yearOfJoining = [];
  List<Map<String, dynamic>> chartData = [];
  await FirebaseFirestore.instance
      .collection('Users Info')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      yearOfJoining.add(DateTime.parse(doc['Date']).year);
    });
  });
  Map<int, int> count = {};
  yearOfJoining.forEach((i) => count[i] = (count[i] ?? 0) + 1);
  count.forEach((key, value) {
    chartData.add({'domain': key.toString(), 'measure': value});
  });
  return chartData;
}
