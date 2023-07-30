import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';

class FavoritesPage extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  const FavoritesPage({super.key, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = favoriteRecipes[index];
          return ListTile(
            title: Text(recipe.autocompleteterm),
            subtitle: Text(recipe.country),
            // Add more recipe details or customization as needed
          );
        },
      ),
    );
  }
}
