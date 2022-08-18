import 'package:adminpanel/constants/textstyles.dart';
import 'package:adminpanel/widgets/create_order_popup.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class OrdersHistory extends StatefulWidget {
  const OrdersHistory({Key? key}) : super(key: key);

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

Stream _dataStream = FirebaseFirestore.instance
    .collection('orders')
    .orderBy('date', descending: true)
    .snapshots();

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        sideBar: sidebarWidget(context, '/orders'),
        body: StreamBuilder(
          stream: _dataStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 27, top: 10, bottom: 10),
                        child: Text(
                          'Orders History',
                          style: TextStyles.heading1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 27, top: 10, bottom: 10),
                        child: createNewOrder(),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      child: DataTable(
                          horizontalMargin: 10,
                          columnSpacing:
                              (MediaQuery.of(context).size.width / 10) * 0.3,
                          showBottomBorder: true,
                          headingTextStyle: TextStyles.heading4.copyWith(),
                          columns: [
                            DataColumn(
                                label: Text(
                              'Order ID',
                            )),
                            DataColumn(
                                label: Text(
                              'Customer',
                            )),
                            DataColumn(
                                label: Text(
                              'Phone',
                            )),
                            DataColumn(label: Text('Product')),
                            DataColumn(
                                label: Text(
                              'Payment',
                            )),
                            DataColumn(label: Text('Created')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Price')),
                            DataColumn(label: Text('Rider Alloted')),
                          ],
                          rows: dataRows(snapshot.data as dynamic)),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }

  List<DataRow> dataRows(QuerySnapshot snap) {
    List<DataRow> newList = snap.docs.map((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      return DataRow(cells: [
        DataCell(Text(
          '${data['order id']}',
        )),
        DataCell(Text('${data['name']}')),
        DataCell(Text('${data['phone']}')),
        DataCell(Text('${data['product']}')),
        DataCell(InkWell(
            onTap: () {
              FirebaseFirestore.instance
                  .collection('orders')
                  .doc(documentSnapshot.id)
                  .update({'payment recieved': !data['payment recieved']});
            },
            child: data['payment recieved'] == true
                ? Text('Recieved', style: TextStyle(color: Colors.green))
                : Text(
                    'Pending',
                    style: TextStyle(color: Colors.red),
                  ))),
        DataCell(Text('${data['date']}')),
        DataCell(Text('${data['status']}')),
        DataCell(Text('${data['amount']}')),
        DataCell(Text(data['rider'] == null ? "NA" : '${data['rider']}')),
      ]);
    }).toList();

    return newList;
  }

  Widget createNewOrder() {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            )),
        onPressed: () {
          createOrderPopup(context);
        },
        icon: Icon(Icons.add),
        label: Text("New Order"));
  }
}
