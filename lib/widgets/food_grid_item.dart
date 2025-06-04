import 'package:flutter/material.dart';
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/pages/food_details_page.dart';
import 'package:food_delivey/ui_models/food_details_args.dart';
import 'package:food_delivey/widgets/favorite_button.dart';



class FoodGridItem extends StatefulWidget {

  //final FoodItemModel foodItemData;
  final int foodIndex;

  FoodGridItem(
    {
      super.key,
      //required this.foodItemData,
      required this.foodIndex
    }
  );

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

//                                 <<<  State  >>>
//==================================================================================

class _FoodGridItemState extends State<FoodGridItem> {

  void navigateToFoodDetailsPage(BuildContext context, int index){
    Navigator.of(context).
    pushNamed(FoodDetailsPage.routeName, arguments: FoodDetailsArgs(index: index)).
          then((value) =>setState(() {}));
  }


  //                              <<<  build  >>>
  // ---------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;


    return InkWell(
      onTap: (){ navigateToFoodDetailsPage(context, widget.foodIndex); },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(23.0),
          color: Colors.white
        ),
        padding: EdgeInsets.all(7),
        child: LayoutBuilder(
          builder: (context,constraints) => Stack(
            children:[
              // Column (first child in the stack)
              Column(
                children: [
                  //image
                  Image.asset(food[widget.foodIndex].imgPath,
                    //height: deviceSize.height*0.119,
                    height: constraints.maxHeight*0.63,
                    width: double.infinity,
                    //fit: BoxFit.cover,
                  ),

                  SizedBox(height: constraints.maxHeight*0.03),
                  //name
                  SizedBox(
                    height: constraints.maxHeight*0.17,
                    child: FittedBox(
                      child: Text(food[widget.foodIndex].name,
                        style: themeData.textTheme.headlineSmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  //price
                  SizedBox(
                    height: constraints.maxHeight*0.17,
                    child: FittedBox(
                      child: Text("${food[widget.foodIndex].price} \$",
                        style:themeData.textTheme.headlineSmall!
                            .copyWith(color: themeData.primaryColor,fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),

              // Icon (second child in the stack)
              Align(
                alignment: Alignment.topRight,
                child: FavoriteButton(
                  foodIndex: widget.foodIndex,
                  height: constraints.maxHeight*0.2,
                  width: constraints.maxWidth*0.2,
                  iconSize: constraints.maxHeight*0.13,
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}
