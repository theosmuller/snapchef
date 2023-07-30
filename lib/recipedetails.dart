import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.autocompleteterm),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                recipe.image,
                width: MediaQuery.of(context).size.width , // Set the desired width for the image
                height: 200, // Set the desired height for the image
                fit: BoxFit.cover, // Set the image fit mode
              ),
              // Display the recipe details here
              Text('Country: ${recipe.country}'),
              Text('Ingredients: ${recipe.country}'),
              Text('Instructions: ${recipe.keyword}'),
              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
