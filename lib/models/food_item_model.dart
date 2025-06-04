class FoodItemModel {
  final String name;
  final String price;
  final String imgPath;
  final bool isFavorite;
  final String size;
  final String calories;
  final String cookingTime;
  final String category;

  FoodItemModel(
    {
      required this.name,
      required this.price,
      required this.imgPath,
      this.isFavorite = false,
      required this.size,
      required this.calories,
      required this.cookingTime,
      required this.category,
    }
  );


  FoodItemModel copyWith({
    String? name,
    String? price,
    String? imgPath,
    bool? isFavorite,
    String? size,
    String? calories,
    String? cookingTime,
    String? category,

  }) {
   return FoodItemModel(
     name: name?? this.name,
     price: price?? this.price,
     imgPath: imgPath?? this.imgPath,
     isFavorite: isFavorite?? this.isFavorite,
     size: size?? this.size,
     calories: calories?? this.calories,
     cookingTime: cookingTime?? this.cookingTime,
     category: category?? this.category,
   );
  }
}




List<FoodItemModel> food = [
  FoodItemModel(name: "Beef Burger", price: "7.5", imgPath: "assets/images/burger.jpg",size: "Medium",calories: "300 Kcal",cookingTime: "10-15 Mins",category: "1"),
  FoodItemModel(name: "Chicken Burger", price: "6.5", imgPath: "assets/images/chicken_burger1.jpg",size: "Medium",calories: "400 Kcal",cookingTime: "15-20 Mins",category: "1"),
  FoodItemModel(name: "Pizza", price: "9", imgPath: "assets/images/pizza.jpg",size: "Large",calories: "500 Kcal",cookingTime: "35 Mins",category: "2"),
  FoodItemModel(name: "Double Burger", price: "8", imgPath: "assets/images/beef_burger.jpg",size: "Large",calories: "450 Kcal",cookingTime: "20 Mins",category: "1"),
  FoodItemModel(name: "Plain Pasta", price: "5.5", imgPath: "assets/images/pasta.jpg",size: "Small",calories: "275 Kcal",cookingTime: "15 Mins",category: "3"),
  FoodItemModel(name: "Cheese Burger", price: "5.5", imgPath: "assets/images/cheese_burger.jpg",size: "Small",calories: "350 Kcal",cookingTime: "25 Mins",category: "1"),
  FoodItemModel(name: "Chicken Pizza", price: "7.5", imgPath: "assets/images/chicken_pizza.jpg",size: "Large",calories: "500 Kcal",cookingTime: "40 Mins",category: "2"),
  FoodItemModel(name: "Chick Shawerma", price: "6", imgPath: "assets/images/chicken_shawerma.jpg",size: "Medium",calories: "275 Kcal",cookingTime: "25 Mins",category: "4"),
  FoodItemModel(name: "Meat Shawerma", price: "8", imgPath: "assets/images/meat_shawerma.png",size: "Medium",calories: "275 Kcal",cookingTime: "25 Mins",category: "4"),
  FoodItemModel(name: "Meat Pasta", price: "8.5", imgPath: "assets/images/Meat_Pasta.png",size: "Small",calories: "200 Kcal",cookingTime: "10 Mins",category: "3"),
  FoodItemModel(name: "Cola", price: "3", imgPath: "assets/images/juices/cola.jpg",size: "Unified",calories: "200 Kcal",cookingTime: "10 Mins",category: "6"),
  //FoodItemModel(name: "Cooktail", price: "6", imgPath: "assets/images/juices/cooktail_juice.jpg",size: "Unified",calories: "200 Kcal",cookingTime: "10 Mins",category: "6"),
  FoodItemModel(name: "Lemon", price: "4.5", imgPath: "assets/images/juices/lemon_juice.jpg",size: "Unified",calories: "200 Kcal",cookingTime: "10 Mins",category: "6"),
  FoodItemModel(name: "Orange", price: "4.5", imgPath: "assets/images/juices/orange_Juice.jpg",size: "Unified",calories: "200 Kcal",cookingTime: "10 Mins",category: "6"),
  FoodItemModel(name: "Ice Cream", price: "4", imgPath: "assets/images/desserts/ice_cream.jpg",size: "Medium",calories: "230 Kcal",cookingTime: "23 Mins",category: "5"),
  FoodItemModel(name: "Cake", price: "5.5", imgPath: "assets/images/desserts/strawberry_cake.jpg",size: "Medium",calories: "260 Kcal",cookingTime: "23 Mins",category: "5"),
];



List<FoodItemModel> favorite = [

];