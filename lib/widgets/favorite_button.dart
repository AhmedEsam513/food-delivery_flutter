import 'package:flutter/material.dart';
import 'package:food_delivey/models/food_item_model.dart';
import 'package:food_delivey/widgets/custom_button.dart';

class FavoriteButton extends StatefulWidget {

  final int foodIndex;
  final double height;
  final double width;
  final double iconSize;


  const FavoriteButton({
    super.key,
    required this.foodIndex,
    required this.height,
    required this.width,
    required this.iconSize,
  });


  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {

  void favoriteIconPressed(){
    setState(() {
      if(food[widget.foodIndex].isFavorite) {
        favorite.remove(food[widget.foodIndex]);
        food[widget.foodIndex]= food[widget.foodIndex].copyWith(isFavorite: false);
      }
      else {
        food[widget.foodIndex]= food[widget.foodIndex].copyWith(isFavorite: true);
        favorite.add(food[widget.foodIndex]);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return CustomButton(
      height: widget.height,
      width: widget.width,
      onTap: () {
        favoriteIconPressed();
      },
      icon: Icon(
        food[widget.foodIndex].isFavorite? Icons.favorite : Icons.favorite_border,
        color: food[widget.foodIndex].isFavorite? themeData.primaryColor : Colors.black,
        size: widget.iconSize),
    );


  }
}
