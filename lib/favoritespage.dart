import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';
import 'package:snapchef/recipedetails.dart';

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
          return GestureDetector(
            onTap: () {
              _navigateToRecipeDetails(context, recipe); // Navigate to details page
            },
            child: ListTile(
              leading: _buildRecipeImage(recipe.image),
              title: Text(recipe.autocompleteterm),
              subtitle: Text(recipe.country),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecipeImage(String imageUri) {
    // Replace this with your image loading logic based on the image URI
    // For example, you can use Image.network if the image is accessible via a URL
    // Or use Image.file if the image is stored locally on the device.
    return Image.network(
      imageUri,
      width: 50, // Set the desired width for the image
      height: 50, // Set the desired height for the image
      fit: BoxFit.cover, // Set the image fit mode
    );
  }
}

void _navigateToRecipeDetails(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailsPage(recipe: recipe),
      ),
    );
  }
