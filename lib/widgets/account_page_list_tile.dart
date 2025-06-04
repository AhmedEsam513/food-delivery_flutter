import 'package:flutter/material.dart';

class AccountPageListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  const AccountPageListTile(
    {
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    }
  );



  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    final isPoretrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        ListTile(
          onTap: (){},
          leading: Icon(
            icon,
            size: isPoretrait? deviceSize.height*0.037:deviceSize.height*0.1,
            color: themeData.primaryColor
          ),

          title : Text(title,style: TextStyle(fontSize: 17)),
          subtitle: subtitle!=null? Text(subtitle!):null,
          trailing: Icon(
            Icons.chevron_right,
            size: isPoretrait? deviceSize.height*0.037:deviceSize.height*0.1,
            color: themeData.primaryColor),
        ),
        Divider(
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
