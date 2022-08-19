import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

createNewProductPopup(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController _productNameController = TextEditingController();
        TextEditingController _descriptionController = TextEditingController();
        TextEditingController _estimatedTimeController =
            TextEditingController();
        TextEditingController _productController = TextEditingController();
        TextEditingController _productIdController = TextEditingController();
        TextEditingController _amountController = TextEditingController();
        Uint8List? image;
        String? imageName;
        return AlertDialog(
          title: Text('Create Order'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                TextField(
                  controller: _productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _estimatedTimeController,
                  decoration: InputDecoration(
                    labelText: 'Estimated Delivery Time',
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
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        image = result.files.single.bytes!;
                        imageName = result.names.single!;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No file selected'),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.image)),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                  onPressed: () async {
                    FirebaseStorage.instance
                        .ref('products/$imageName')
                        .putData(image!, SettableMetadata(contentType: 'image'))
                        .then((image) {
                      image.ref.getDownloadURL().then((url) {
                        print(url);
                        FirebaseFirestore.instance.collection('products').add({
                          'name': _productNameController.text,
                          'description': _descriptionController.text,
                          'estimatedTime': _estimatedTimeController.text,
                          'product': _productController.text,
                          'productId': _productIdController.text,
                          'amount': _amountController.text,
                          'image': url
                        });
                      });
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
