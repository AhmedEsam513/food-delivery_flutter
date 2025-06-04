import 'package:flutter/material.dart';


Widget ordersVouchersItem(ThemeData themeData ,{required String name,required int count}){
  return Column(
    children: [
      Text(
          count.toString(),
          style: themeData.textTheme.headlineMedium!
              .copyWith(color: Colors.deepOrange,fontWeight: FontWeight.w700)
      ),
      Text(
          name,
          style: themeData.textTheme.titleMedium!.copyWith(color: Colors.grey[600])

      ),
    ],
  );
}


Widget accountImage(double height,double width) {

  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/Ahmed_Esam.jpg"),
      ),
    ),
  );
}


List<Widget> portraitMode(Size size,ThemeData themeData) {
  return [

    accountImage(size.height*0.2, size.width),
    SizedBox(height:size.height*0.01),
    Text("Ahmed Esam", style: themeData.textTheme.headlineLarge),
    SizedBox(height: size.height*0.04),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ordersVouchersItem(themeData,name: "Orders", count: 10),
        ordersVouchersItem(themeData,name: "Vouchers", count: 2),
      ]
    )

  ];

}

List<Widget> landscapeMode(Size size, ThemeData themeData) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        accountImage(size.height*0.4, size.width*0.2),

        SizedBox(width: size.width*0.018),

        Column(
          children: [
            Text("Ahmed Esam", style: themeData.textTheme.headlineLarge),
            SizedBox(height: size.height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ordersVouchersItem(themeData,name: "Orders", count: 10),
                SizedBox(width: size.width*0.04),
                ordersVouchersItem(themeData,name: "Vouchers", count: 2),

              ],
            ),
          ],
        ),
      ],
    ),
  ];

}