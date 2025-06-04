import 'package:flutter/material.dart';
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/pages/food_details_page.dart';
import 'package:food_delivey/ui_models/food_details_args.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {


  void favoriteIconPressed(int index){
    setState(() {
      int targetedIndex = food.indexOf(favorite[index]);

      food[targetedIndex] = food[targetedIndex].copyWith(isFavorite: !food[targetedIndex].isFavorite);
      favorite.remove(favorite[index]);
    });
  }



  void navigateToFoodDetailsPage(BuildContext context,int index){
    int targetedIndex = food.indexOf(favorite[index]);
    Navigator.of(context).
    pushNamed(FoodDetailsPage.routeName,arguments: FoodDetailsArgs(index: targetedIndex)).
            then((value)=>setState((){}));
  }

  @override
  Widget build(BuildContext context) {

    final deviceSize = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;





    return favorite.isNotEmpty? ListView.builder(
      physics: BouncingScrollPhysics(),

      padding: EdgeInsets.all(10.0),
      itemCount: favorite.length,

      itemBuilder: (context,index) => Padding( //favorite_item
        padding: const EdgeInsets.only(bottom: 5.0),
        child: SizedBox(
          height: isPortrait? deviceSize.height * 0.155 : deviceSize.height * 0.41,
          child: InkWell(
            onTap: () { navigateToFoodDetailsPage(context,index); },
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(13.0),

                //LayoutBuilder & Row
                child: LayoutBuilder(
                  builder:(context,constraints) => Row(

                    children: [

                      //image
                      Image.asset(
                        favorite[index].imgPath,
                        width: constraints.maxWidth*0.34,
                      ),

                      SizedBox(width: constraints.maxWidth*0.001),

                      //name and price
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            //name
                            SizedBox(
                              //when i print the {constraints.maxHeight}
                              // before wrapping with SizedBox it equals (Infinity)

                              height: constraints.maxHeight*0.31,
                              child: FittedBox(
                                child: Text(
                                    favorite[index].name,
                                    style: themeData.textTheme.headlineSmall!
                                        .copyWith(fontWeight: FontWeight.w500)
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            //price
                            SizedBox(
                              height: constraints.maxHeight*0.31,
                              child: FittedBox(
                                child: Text(
                                  "\$ ${favorite[index].price}",
                                  style: themeData.textTheme.headlineSmall!
                                      .copyWith(color: themeData.primaryColor,fontWeight: FontWeight.w500)

                                ),
                              ),
                            ),
                          ]
                      ),

                      Spacer(),
                      IconButton(
                        //color: Colors.black,
                          onPressed: () {favoriteIconPressed(index);},
                          icon: Icon(
                            Icons.favorite,
                            color:themeData.primaryColor,
                            size: 30,
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

    )

    //Empty Favorite Page
    :Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_favorites.png",
              height: isPortrait? deviceSize.height * 0.3:deviceSize.height * 0.39,
              width: deviceSize.width * 0.65,
            ),
            SizedBox(height: deviceSize.height*0.05),
            SizedBox(
              height: isPortrait? deviceSize.height * 0.05:deviceSize.height * 0.09,
              child: FittedBox(
                child: Text(
                  "No Favorite Items Found!",
                  style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500,color: Colors.grey[600])
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
// child: SingleChildScrollView(
// child: Column(
// //children: List.generate( food.length, (index) =>FoodFavoriteItem(dataUnit: food[index])) ,
// children: indecies.map((index)=>FoodFavoriteItem(dataUnit: food[index])).toList(),
// ),
// ),