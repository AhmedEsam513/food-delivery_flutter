import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivey/pages/bottom_nav_bar.dart';
import 'package:food_delivey/pages/food_details_page.dart';
import 'package:food_delivey/pages/home_page.dart';


void main() {

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const BottomNavBarPage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor:Colors.grey[200],

        //useMaterial3: true ,
        //colorSchemeSeed: Colors.deepOrange,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          shadowColor: Colors.deepOrange,
          elevation: 5,
        ),

      ),
      routes: {
        "/": (context) => const BottomNavBarPage(),
        FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
      },
    );
  }
}
