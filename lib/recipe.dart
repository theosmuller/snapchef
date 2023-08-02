import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

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
  static late List<String> recipeNames;
  static List<Recipe> favorites = [];

  static Future loadRecipe() async {
    try {
      recipes = <Recipe>[];
      recipeNames = <String>[];
      String jsonString = await rootBundle.loadString('recipes.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['recipes'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        recipes.add(Recipe.fromJson(categoryJson[i]));
        recipeNames.add(recipes[i].autocompleteterm);
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

      final Directory directory;
      if (kIsWeb) {
        // You cannot modify assets directly on the web.
        // Instead, you can consider using a web API to store and retrieve data.
        // For local development/testing, consider using non-web platforms (e.g., Android, iOS).
        print('Cannot modify assets on the web.');
        return;
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      final file = File('${directory.path}/favorites.json');
      List<Map<String, dynamic>> favoriteRecipesJson =
          favorites.map((recipe) => recipe.toJson()).toList();
      Map<String, dynamic> data = {'recipes': favoriteRecipesJson};

      await file.writeAsString(json.encode(data));
    } catch (e) {
      print(e);
    }
  }

  static Future<void> removeFavoriteRecipe(Recipe recipe) async {
    try {
      favorites.remove(recipe);

      final Directory directory;
      if (kIsWeb) {
        // You cannot modify assets directly on the web.
        // Instead, you can consider using a web API to store and retrieve data.
        // For local development/testing, consider using non-web platforms (e.g., Android, iOS).
        print('Cannot modify assets on the web.');
        return;
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      final file = File('${directory.path}/favorites.json');
      List<Map<String, dynamic>> favoriteRecipesJson =
          favorites.map((recipe) => recipe.toJson()).toList();
      Map<String, dynamic> data = {'recipes': favoriteRecipesJson};

      await file.writeAsString(json.encode(data));
    } catch (e) {
      print(e);
    }
  }
}
