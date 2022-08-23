import 'package:adminpanel/constants/textstyles.dart';
import 'package:adminpanel/widgets/create_product.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Stream _dataStream =

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        sideBar: sidebarWidget(context, 'products'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 10, bottom: 10),
                  child: Text(
                    'Products',
                    style: TextStyles.heading1,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 27, top: 10, bottom: 10),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0),
                            )),
                        onPressed: () {
                          createNewProductPopup(context);
                        },
                        icon: Icon(Icons.add),
                        label: Text("New Product")))
              ],
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                      child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: MediaQuery.of(context)
                                          .size
                                          .height *
                                      0.28,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount:
                                      (MediaQuery.of(context).size.width ~/ 250)
                                          .toInt()),
                          children: dataCards(snapshot.data as dynamic)),
                    );
                  }
                }))
          ],
        ));
  }

  List<Card> dataCards(QuerySnapshot snap) {
    List<Card> newList = snap.docs.map((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;

      return Card(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              "https://pngimg.com/uploads/iphone_13/iphone_13_PNG22.png",
              height: (MediaQuery.of(context).size.height * 0.28) / 2,
            ),
          ),
          Text(
            "IPhone 13",
            style: TextStyles.heading4,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "999\$",
                style: TextStyles.regular3.copyWith(color: Colors.grey),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "ID: IP13P",
                style: TextStyles.regular4,
              ),
              Spacer(),
              Text(
                "In Stock",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ));
    }).toList();

    return newList;
  }
}
