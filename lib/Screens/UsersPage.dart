import 'package:adminpanel/constants/textstyles.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final Stream<QuerySnapshot> _dataStream =
      FirebaseFirestore.instance.collection('Users Info').snapshots();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        sideBar: sidebarWidget(context, 'users'),
        body: StreamBuilder(
            stream: _dataStream,
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                return DataTable(
                    showBottomBorder: true,
                    headingTextStyle: TextStyles.heading4,
                    columns: [
                      DataColumn(
                          label: Flexible(
                        flex: 2,
                        child: Text(
                          ' ',
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'Name',
                      )),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Phone Number')),
                      DataColumn(label: Text('Date of Creation')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: dataRows(snapshot.data as dynamic));
              }
            })));
  }

  List<DataRow> dataRows(QuerySnapshot snap) {
    List<DataRow> newList = snap.docs.map((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      return DataRow(cells: [
        DataCell(CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage('${data['Profile']}'),
        )),
        DataCell(Text('${data['Name']}')),
        DataCell(Text('${data['Email']}')),
        DataCell(Text('${data['Phone']}')),
        DataCell(Text('${data['Date']}')),
        DataCell(ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: data['isBlocked'] == true ? Colors.red : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('Users Info')
                  .doc(documentSnapshot.id)
                  .update({'isBlocked': !data['isBlocked']});
            },
            child: Text(data['isBlocked'] == true ? 'Blocked' : 'Active'))),
      ]);
    }).toList();

    return newList;
  }
}
