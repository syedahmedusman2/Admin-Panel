import 'package:adminpanel/constants/textstyles.dart';
import 'package:adminpanel/widgets/create_product.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
            // Image.network(
            //     'https://firebasestorage.googleapis.com/v0/b/admilpanel.appspot.com/o/products%2FScreenshot%20(41)(5).jpg?alt=media&token=677b7375-17b5-4a46-8b2a-b336ef73d6ba')
          ],
        ));
  }
}
