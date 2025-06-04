import 'package:flutter/material.dart';
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/widgets/custom_button.dart';
import 'package:food_delivey/widgets/favorite_button.dart';

class DetailsTopPanner extends StatelessWidget {

  final int foodIndex;
  final VoidCallback backButtonPressed;
  const DetailsTopPanner({super.key, required this.foodIndex, required this.backButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: deviceSize.height * 0.5,
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    height:50, width:50, onTap: backButtonPressed,
                    icon: Icon(Icons.arrow_back,size: 30,color: Colors.black,)
                ),
                FavoriteButton(
                  foodIndex: foodIndex, height:50, width:50, iconSize: 30,
                )

              ],
            ),
            Image.asset(food[foodIndex].imgPath),
          ],

        ),
      ),
    );
  }
}
