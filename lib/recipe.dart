import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class Recipe {
  String keyword;
  int id;
  String autocompleteterm;
  String country;
  String image;

  Recipe(
      {required this.keyword,
      required this.id,
      required this.autocompleteterm,
      required this.country,
      required this.image});

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    return Recipe(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autocompleteterm: parsedJson['autocompleteTerm'] as String,
        country: parsedJson['country'] as String,
        image: parsedJson['image'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'keyword': keyword,
      'id': id,
      'autocompleteTerm': autocompleteterm,
      'country': country,
      'image': image,
    };
  }
}


class RecipeViewModel {
  static late List<Recipe> recipes;
  static late List<Recipe> favorites;

  static Future loadRecipe() async {
    try {
      recipes = <Recipe>[];
      String jsonString = await rootBundle.loadString('recipes.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['recipes'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        recipes.add(Recipe.fromJson(categoryJson[i]));
      }
      favorites = <Recipe>[];
      jsonString = await rootBundle.loadString('favorites.json');
      parsedJson = json.decode(jsonString);
      categoryJson = parsedJson['recipes'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        favorites.add(Recipe.fromJson(categoryJson[i]));
      }

      for (Recipe recipe in recipes) {
        print(recipe.autocompleteterm);
      }
    } catch (e) {
      print(e);
    }
  }

static Future<void> saveFavoriteRecipe(Recipe recipe) async {
    try {
      favorites.add(recipe);

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/favorites.json');

      List<Map<String, dynamic>> favoriteRecipesJson = favorites.map((recipe) => recipe.toJson()).toList();
      Map<String, dynamic> data = {'recipes': favoriteRecipesJson};

      await file.writeAsString(json.encode(data));
    } catch (e) {
      print(e);
    }
  }

}
