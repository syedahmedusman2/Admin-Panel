import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

SideBar sidebarWidget(context, route) {
  return SideBar(
    header: Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: AssetImage("assets/images/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text("The Titanium",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    ),
    textStyle: TextStyle(color: Colors.white),
    backgroundColor: Theme.of(context).primaryColor,
    items: const [
      AdminMenuItem(title: "Home", icon: Icons.home, route: '/home'),
      AdminMenuItem(title: "Users", icon: Icons.people, route: '/users'),
      AdminMenuItem(title: "Orders", icon: Icons.history, route: '/orders'),
      AdminMenuItem(
          title: "Products", icon: Icons.shopping_bag, route: '/products'),
      AdminMenuItem(title: "Logout", icon: Icons.logout, route: '/login'),
    ],
    activeBackgroundColor: Color(0xff6938ec),
    activeIconColor: Colors.white,
    activeTextStyle: TextStyle(color: Colors.white),
    selectedRoute: '/$route',
    borderColor: Theme.of(context).primaryColor,
    onSelected: (AdminMenuItem data) {
      if (data.route == "/login") {
        FirebaseAuth.instance.signOut();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(data.route!, (route) => false);
      } else {
        Navigator.pushNamed(context, data.route!);
      }
    },
  );
}
