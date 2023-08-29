import 'package:flutter/material.dart';
import 'package:snapchef/recipedetails/restriction_label.dart';
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
      body: Stack(
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
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${widget.recipe.autocompleteterm}",
                            style: const TextStyle(
                              fontFamily: 'CreteRound',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 12), // Add some spacing between sections
                      Center(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.access_time_filled_rounded, color: Colors.grey), // Icon in the first row of the first column
                                      SizedBox(height: 8), // Spacer between icon and text
                                      Text(
                                        "60 min",
                                        style: TextStyle(
                                          fontFamily: 'CreteRound',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30, // Adjust the height to match your needs
                                child: VerticalDivider(
                                  color: Colors.grey[400],
                                  thickness: 1,
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            RestrictionsLabel(label: 'Vegetarian'),
                                            SizedBox(height: 10),
                                            RestrictionsLabel(label: 'Vegan'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RestrictionsLabel(label: 'Gluten-free'),
                                          SizedBox(height: 10),
                                          RestrictionsLabel(label: 'Spicy'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                  ],
                                ), // Blank row 3
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                ), // Add left margin to "Ingredients" text
                            child: Text(
                              'Ingredients',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CreteRound',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16),
                            child: Text(
                              "Flour, Butter, Sugar, Lemon, Condensed Milk",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                 top: 16),
                            child: Text(
                              'Instructions',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CreteRound',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rutrum cursus tortor in ultricies. Maecenas feugiat velit leo, vitae hendrerit eros consequat non. Aenean in sem lorem. Nunc quis pulvinar ipsum, vel blandit lorem. Duis dui nunc, finibus id fermentum sit amet, molestie sed ex. Maecenas sit amet erat fermentum, sodales tellus dapibus, molestie dolor. Nullam et rhoncus ipsum, ullamcorper egestas diam. Aliquam nec sollicitudin turpis. Aliquam ullamcorper aliquam tellus, maximus semper enim hendrerit sit amet. Nulla ut rutrum nulla, non bibendum sem. Vivamus mollis bibendum quam, ut blandit felis. In ac tristique ligula, vel bibendum leo. Ut lobortis id mauris vestibulum feugiat. Morbi pellentesque facilisis nisi, sed dignissim velit.",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
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
