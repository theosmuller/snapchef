
import 'package:flutter/material.dart';
import 'package:snapchef/autocomplete.dart';
import 'package:snapchef/recipe/recipe.dart';
import 'package:snapchef/recipedetails/recipedetails.dart';

import 'bottombar.dart';
import 'list_recipe_icon.dart';

class ListPage extends StatelessWidget {
  final bool isFavorites;
  final String? filter;

  ListPage({super.key, required this.isFavorites, this.filter});


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: isFavorites? Recipe.filteredFavoriteRecipesAsync(filter!.toLowerCase()) : Recipe.filteredRecipesAsync(filter!.toLowerCase()) ,
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(),
              body: const Column(children: [
                Text("Fetching recipes...")
              ]),
              bottomNavigationBar: const BottomBar(),
            );
          }
          else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else {
              return Scaffold(
                appBar: AppBar(),
                body: Column(children: [
                  AutoCompleteWidget(favorites: isFavorites),
                  snapshot.data!.isEmpty
                      ? const Center(
                      child: Expanded(child: Text(
                        'No recipes found :(',
                        style: TextStyle(fontSize: 20),
                      ),
                      ))
                      : Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Recipe recipe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            _navigateToRecipeDetails(
                                context, recipe); // Navigate to details page
                          },
                          child: ListTile(
                            leading: _buildRecipeImage(recipe.image, recipe.favorite),
                            title: Text(recipe.autocompleteterm),
                            subtitle: Text(recipe.country),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
                bottomNavigationBar: const BottomBar(),
              );
            }
          }
        });
  }
  //   List<Recipe> recipes = [];
  //   return Scaffold(
  //       appBar: AppBar(),
  //       body: Column(children: [
  //           AutoCompleteWidget(),
  //         recipes.isEmpty
  //             ? const Center(
  //                 child: Expanded(child: Text(
  //                   'No recipes found :(',
  //                   style: TextStyle(fontSize: 20),
  //                 ),
  //               ))
  //             : Expanded(
  //                 child: ListView.builder(
  //                   itemCount: recipes.length,
  //                   itemBuilder: (context, index) {
  //                     Recipe recipe = recipes[index];
  //                     return GestureDetector(
  //                       onTap: () {
  //                         _navigateToRecipeDetails(
  //                             context, recipe); // Navigate to details page
  //                       },
  //                       child: ListTile(
  //                         leading: _buildRecipeImage(recipe.image),
  //                         title: Text(recipe.autocompleteterm),
  //                         subtitle: Text(recipe.country),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //       ]),
  //       bottomNavigationBar: const BottomBar() ,
  //   );
  // }

  Widget _buildRecipeImage(String imageUri, int isSaved) {
    bool favoriteIcon = false;
    if(isSaved == 1) favoriteIcon = true;

    return RecipeImageWithStar(
      imageUri: imageUri,
      width: 100,
      height: 100,
      isFavorite: favoriteIcon
    );
  }
}

void _navigateToRecipeDetails(BuildContext context, Recipe recipe) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecipeDetailsPage(recipe: recipe, saved: recipe.favorite),
    ),
  );
}
