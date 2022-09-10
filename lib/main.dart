import 'package:adminpanel/Screens/UsersPage.dart';
import 'package:adminpanel/Screens/homepage.dart';
import 'package:adminpanel/Screens/login_screen.dart';
import 'package:adminpanel/Screens/orders_page.dart';
import 'package:adminpanel/Screens/product_page.dart';
import 'package:adminpanel/constants/colors.dart';
import 'package:adminpanel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/users': (context) => UsersPage(),
        '/orders': (context) => OrdersHistory(),
        '/products': (context) => ProductPage(),
      },
      initialRoute: '/login',
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily, primarySwatch: myColor),
    );
  }
}
