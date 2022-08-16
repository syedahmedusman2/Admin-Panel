import 'package:flutter/material.dart';

class SideMenuItemWidget extends StatelessWidget {
  const SideMenuItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.home),
          ),
          Text(
            "Home",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
