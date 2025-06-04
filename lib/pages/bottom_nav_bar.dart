import 'package:flutter/material.dart';
import 'package:food_delivey/pages/account_page.dart';
import 'package:food_delivey/pages/favorite_page.dart';
import 'package:food_delivey/pages/home_page.dart';
import 'package:food_delivey/widgets/account_page_list_tile.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {

 int _tappedIndex = 0;

 void onItemTapped(int index){
   setState(() {
     _tappedIndex = index;
   });
}

  List<Widget> bodyOptions =[
    HomePage(),
    FavoritePage(),
    AccountPage(),
  ];


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width:89,),
            Text("Foodak",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500)),
          ],
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 100),
            AccountPageListTile(icon: Icons.home, title: "Home"),
            AccountPageListTile(icon: Icons.favorite, title: "Favorites"),
            AccountPageListTile(icon: Icons.person, title: "My Account"),
          ],
        ),
      ),

      body: SafeArea(child: bodyOptions[_tappedIndex]),

      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.favorite),label: 'Favorites'),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: 'Account'),
        ],

        currentIndex: _tappedIndex,
        onTap: onItemTapped,

        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        //type: BottomNavigationBarType.fixed,

      ),
    );
  }
}
