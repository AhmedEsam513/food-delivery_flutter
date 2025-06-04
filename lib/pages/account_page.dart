import 'package:flutter/material.dart';
import 'package:food_delivey/widgets/account_page_list_tile.dart';
import 'package:food_delivey/widgets/account_page_widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});


  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);


    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height:isPortrait? deviceSize.height*0.025:deviceSize.height*0.05),

            if(isPortrait) ...portraitMode(deviceSize, themeData),

            if(!isPortrait) ...landscapeMode(deviceSize, themeData),

            SizedBox(height:isPortrait? deviceSize.height*0.01:deviceSize.height*0.04),

            Divider(indent: 20,endIndent: 20,thickness: 1.5,),
      
            AccountPageListTile(icon: Icons.shopping_bag_outlined, title: "Past Orders"),
            AccountPageListTile(icon: Icons.card_giftcard, title: "Vouchers"),
      
          ],
        ),
      ),
    );
  }
}
