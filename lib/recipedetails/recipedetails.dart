import 'package:flutter/material.dart';
import 'package:snapchef/stepbystep/stepbystep.dart';
import 'package:snapchef/recipe/recipe.dart';

import '../bottombar.dart';
import 'favorite_button.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;
  final int saved;

  const RecipeDetailsPage({Key? key, required this.recipe, required this.saved}) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _saved = 0;
  int get saved => _saved;

  set saved(int newValue) {
    setState(() {
      _saved = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _saved = widget.saved;

  }

  @override
  Widget build(BuildContext context) {

    IconData isFavoriteRecipeIcon = saved == 1 ? Icons.star : Icons.star_border_outlined;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.autocompleteterm),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.network(
                    widget.recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FavoriteButton(
                          label: 'Steps',
                          onPressed: () {
                            _navigateToFirstStep(context, widget.recipe);
                          },
                          iconData: Icons.play_arrow,
                          backgroundColor: Colors.amber,
                        ),
                        const SizedBox(width: 0),
                        FavoriteButton(
                          label: 'Favorite',
                          onPressed: () {
                            _toggleFavoriteStatus();
                          },
                          iconData: isFavoriteRecipeIcon,
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country: ${widget.recipe.country}'),
                      const SizedBox(
                          height: 12), // Add some spacing between sections
                      Text('Ingredients: ${widget.recipe.keyword}'),
                      const SizedBox(
                          height: 12), // Add some spacing between sections
                      Text('Instructions: ${widget.recipe.country}'),
                      // Add more details as needed
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: const BottomBar() ,
    );
  }

  void _navigateToFirstStep(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirstStepScreen(recipe: recipe),
      ),
    );
  }

  void _toggleFavoriteStatus() {
    setState(() {
      if (saved == 1) {
        //RecipeViewModel.saveFavoriteRecipe(widget.recipe);
      } else {
        //RecipeViewModel.removeFavoriteRecipe(widget.recipe);
      }
      saved = saved == 1 ? 0 : 1;
    });
  }
}
