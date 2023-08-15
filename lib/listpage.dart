
import 'package:flutter/material.dart';
import 'package:snapchef/autocomplete.dart';
import 'package:snapchef/recipe/recipe.dart';
import 'package:snapchef/recipedetails/recipedetails.dart';

import 'bottombar.dart';

class ListPage extends StatelessWidget {
  final bool isFavorites;
  final String? filter;

  ListPage({super.key, required this.isFavorites, this.filter});


  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(future: isFavorites? Recipe.filteredFavoriteRecipesAsync(filter!.toLowerCase()) : Recipe.filteredRecipesAsync(filter!.toLowerCase()) , builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //
    //   }
    // })
    List<Recipe> recipes = [];
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
            AutoCompleteWidget(),
          recipes.isEmpty
              ? const Center(
                  child: Expanded(child: Text(
                    'No recipes found :(',
                    style: TextStyle(fontSize: 20),
                  ),
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      Recipe recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          _navigateToRecipeDetails(
                              context, recipe); // Navigate to details page
                        },
                        child: ListTile(
                          leading: _buildRecipeImage(recipe.image),
                          title: Text(recipe.autocompleteterm),
                          subtitle: Text(recipe.country),
                        ),
                      );
                    },
                  ),
                ),
        ]),
        bottomNavigationBar: const BottomBar() ,
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
