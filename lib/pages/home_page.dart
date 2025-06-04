// Dart
import 'dart:io';

// Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivey/models/category_model.dart';

// Internals
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/pages/food_details_page.dart';
import 'package:food_delivey/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FoodItemModel> filteredFood = food;

  int categoryChoosen = -1;

  void categoryUnpressed(){
    setState(() {
      categoryChoosen = -1;
      filteredFood = food;
    });
  }

  void categoryPressed(int index){
    setState(() {
      categoryChoosen = index;
      filteredFood = food.where( (element) => element.category == categories[categoryChoosen].id ).toList();

    });
  }

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final themeData = Theme.of(context);



    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(//Main Column in HomePage
          children: [
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset("assets/images/burger_banner.jpg",
                height: isPortrait? deviceSize.height *0.28 : deviceSize.height*0.7,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: isPortrait? deviceSize.height*0.05:deviceSize.height*0.14),

            SizedBox(
              height: isPortrait? deviceSize.height*0.123:deviceSize.height*0.16,
              width: double.infinity,

              // ListView.builder
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),

                itemCount: categories.length,

                // CategoryItem
                itemBuilder: (context,index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 15),
                  child: InkWell(
                    onTap: (){categoryPressed(index);},
                    onDoubleTap: categoryUnpressed,
                    child: Container(
                      height: deviceSize.height*0.1,
                      width: isPortrait? deviceSize.width*0.2 : deviceSize.width*0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: categoryChoosen == index? themeData.primaryColor : Colors.white,

                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: LayoutBuilder(
                          builder:(context,constraints) => isPortrait? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                categories[index].imgPath,
                                height: constraints.maxHeight*0.6,
                                width: constraints.maxWidth,
                              ),
                              SizedBox(height: constraints.maxHeight*0.07),
                              SizedBox(
                                height: constraints.maxHeight*0.2,
                                width: constraints.maxWidth,
                                child: FittedBox(
                                  child: Text(
                                    categories[index].title,
                                    style: themeData.textTheme.titleLarge!
                                      .copyWith(
                                      color: categoryChoosen == index? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                )
                              ),
                            ],
                          ):

                          // Category Landscape Mode
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: constraints.maxWidth*0.05),
                              Image.asset(
                                categories[index].imgPath,
                                height: constraints.maxHeight*0.9,
                                //width: constraints.maxWidth,
                              ),
                              SizedBox(width: constraints.maxWidth*0.03),
                              SizedBox(
                                  height: constraints.maxHeight*0.34,
                                  //width: constraints.maxWidth,
                                  child: FittedBox(
                                    child: Text(
                                      categories[index].title,
                                      style: themeData.textTheme.titleLarge!
                                          .copyWith(
                                        color: categoryChoosen == index? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: isPortrait? deviceSize.height*0.02:deviceSize.height*0.04),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait? 2 : 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0
              ),

              itemCount: filteredFood.length,
              itemBuilder: (context, index) => FoodGridItem(foodIndex: food.indexOf(filteredFood[index])),

              //itemCount: food.length,
              //itemBuilder: (context, index) => FoodGridItem(foodIndex: index),
            ),
          ],
        ),
      ),
    );
  }
}
