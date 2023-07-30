import 'dart:convert';

import 'package:flutter/services.dart';

class Recipe {
  String keyword;
  int id;
  String autocompleteterm;
  String country;

  Recipe({
    required this.keyword,
    required this.id,
    required this.autocompleteterm,
    required this.country
  });

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    return Recipe(
        keyword: parsedJson['keyword'] as String,
        id: parsedJson['id'],
        autocompleteterm: parsedJson['autocompleteTerm'] as String,
        country: parsedJson['country'] as String
    );
  }

  
}

class RecipeViewModel {
  static late List<Recipe> recipes;

  static Future loadRecipe() async {
    try {
      recipes = <Recipe>[];
      String jsonString = await rootBundle.loadString('recipes.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['recipes'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        recipes.add(Recipe.fromJson(categoryJson[i]));
      }

    for (Recipe recipe in recipes){
      print (recipe.autocompleteterm);
    }
      
    } catch (e) {
      print(e);
    }
  }
}

