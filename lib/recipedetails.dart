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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.network(
                recipe.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add onPressed logic for "Steps" button
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 24,
                      ),
                      label: const Text(
                        'Steps',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 109, 65), // Golden yellow color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Add some spacing between buttons
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add onPressed logic for "Save as Favorite" button
                      },
                      icon: const Icon(
                        Icons.star,
                        size: 24,
                      ),
                      label: const Text(
                        'Save as Favorite',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Orange color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Country: ${recipe.country}'),
                  const SizedBox(height: 12), // Add some spacing between sections
                  Text('Ingredients: ${recipe.keyword}'),
                  const SizedBox(height: 12), // Add some spacing between sections
                  Text('Instructions: ${recipe.country}'),
                  // Add more details as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

