import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

createOrderPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController _nameController = TextEditingController();
        TextEditingController _phoneController = TextEditingController();
        TextEditingController _addressController = TextEditingController();
        TextEditingController _productController = TextEditingController();
        TextEditingController _productIdController = TextEditingController();
        TextEditingController _amountController = TextEditingController();
        return AlertDialog(
          title: Text('Create Order'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Customer Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _productController,
                  decoration: InputDecoration(
                    labelText: 'Product',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _productIdController,
                  decoration: InputDecoration(
                    labelText: 'Product ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Billed Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                  onPressed: () {
                    DateTime now = DateTime.now();
                    FirebaseFirestore.instance.collection("orders").add({
                      "order id": Timestamp.now()
                          .microsecondsSinceEpoch
                          .toString()
                          .substring(0, 13),
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "address": _addressController.text,
                      "product": _productController.text,
                      "productId": _productIdController.text,
                      "amount": _amountController.text,
                      "payment recieved": false,
                      "date": "${now.day}/${now.month}/${now.year}",
                      "time": "${now.hour}:${now.minute}",
                      "status": "Pending",
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Order Created")));
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Create'),
                )
              ],
            ),
          ),
        );
      });
}
