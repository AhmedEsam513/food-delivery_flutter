import 'package:flutter/material.dart';
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/ui_models/food_details_args.dart';
import 'package:food_delivey/widgets/custom_button.dart';
import 'package:food_delivey/widgets/favorite_button.dart';
import 'package:food_delivey/widgets/food_details_page_widgets/counter_widget.dart';
import 'package:food_delivey/widgets/food_details_page_widgets/property_widget.dart';

class FoodDetailsPage extends StatefulWidget {

  static const String routeName = "/food-details";

  const FoodDetailsPage({super.key});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}


// State
class _FoodDetailsPageState extends State<FoodDetailsPage> {

  int counter = 1;

  void backButtonPressed(BuildContext context){
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);

    final FoodDetailsArgs foodArgs = ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;

    final int foodIndex = foodArgs.index;
    final foodItem = food[foodIndex];

    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(

                slivers: [

                  SliverAppBar(
                    expandedHeight: deviceSize.height*0.45,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background:  Image.asset(foodItem.imgPath),
                    ),


                    pinned: true,
                    scrolledUnderElevation: 1.5,

                    leadingWidth: 80,
                    leading: Padding(
                      padding: EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                      child: CustomButton(
                          height:50, width:50,
                          onTap: () {backButtonPressed(context);},
                          icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,)
                      ),
                    ),

                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                        child: FavoriteButton(
                          foodIndex: foodIndex, height:50, width:55, iconSize: 30,
                        ),
                      ),
                    ],

                  ),


                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodItem.name,
                                      style: themeData.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: deviceSize.height*0.005,),
                                    Text(
                                      "Buffalo Burger",
                                      style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
                                    )
                                  ],
                                ),

                                Spacer(),

                                CounterWidget(),
                              ],
                            ),
                            SizedBox(height: deviceSize.height*0.05,),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertWidget(propertyName: "Size", propertyValue:foodItem.size),
                                  VerticalDivider(thickness: 3,color: Colors.grey),
                                  PropertWidget(propertyName: "Calories", propertyValue:foodItem.calories),
                                  VerticalDivider(thickness: 3,color: Colors.grey),
                                  PropertWidget(propertyName: "Cooking", propertyValue:foodItem.cookingTime),

                                ],
                              ),
                            ),
                            SizedBox(height: deviceSize.height*0.02,),
                            Text("Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"
                                " Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"
                                " Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"
                                " Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum "
                                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),

                    ]),
                  ),

                ],

              ),
            ),

            Divider(thickness: 1,color: Colors.grey[500],),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 7.0),
              child: Row(
                children: [
                  Text(
                    "\$ ${foodItem.price}",
                    style: themeData.textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.w600,color: themeData.primaryColor),
                  ),
                  SizedBox(width: deviceSize.width*0.2,),
                  Expanded(
                    child: SizedBox(
                      height: deviceSize.height*0.05,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor:themeData.primaryColor),
                        child: SizedBox(
                          height: deviceSize.height*0.033,
                          child: FittedBox(
                            child: Text(
                              "Add to Cart",
                              style: themeData.textTheme.titleSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: deviceSize.height*0.01,)
          ],
        ),
      ),
    );
  }
}
