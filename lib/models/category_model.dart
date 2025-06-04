import 'package:food_delivey/utilities/app_assets.dart';

class CategoryModel {
  final String id;
  final String imgPath;
  final String title;

  CategoryModel({required this.id, required this.imgPath, required this.title});

}

List<CategoryModel> categories = [
  CategoryModel(id: "1", imgPath: AppAssets.burgerIcon, title: "Burger"),
  CategoryModel(id: "2", imgPath: AppAssets.pizzaIcon, title: "Pizza"),
  CategoryModel(id: "3", imgPath: AppAssets.pastaIcon, title: "Pasta"),
  CategoryModel(id: "4", imgPath: AppAssets.shawrmaIcon, title: "Shawerma"),
  CategoryModel(id: "5", imgPath: AppAssets.dessertIcon, title: "Dessert"),
  CategoryModel(id: "6", imgPath: AppAssets.drinkIcon, title: "Drink"),


];