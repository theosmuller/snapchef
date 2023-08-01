import 'package:flutter/material.dart';
import 'package:snapchef/firstStep.dart';
import 'package:snapchef/recipe.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  bool saved = false;

  @override
  void initState() {
    super.initState();
    saved = RecipeViewModel.favorites.contains(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.autocompleteterm),
      ),
      body: SingleChildScrollView(
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
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _navigateToFirstStep(context, widget.recipe);
                        },
                        icon: const Icon(Icons.play_arrow, color: Colors.white, shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(120, 0, 0, 0),
                          ),
                        ]),
                        label: const Text(
                          'Steps',
                          style: TextStyle(fontFamily: 'CreteRound', fontSize: 24, color: Colors.white, shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(120, 0, 0, 0),
                            ),
                          ]),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 255, 217, 65), // Golden yellow
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 0), // No spacing between buttons
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _toggleFavoriteStatus();
                          print('Favorites button pressed');
                        },
                        icon: const Icon(Icons.star_border_outlined, color: Colors.white, shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(120, 0, 0, 0),
                          ),
                        ]),
                        label: const Text(
                          'Favorites',
                          style: TextStyle(fontFamily: 'CreteRound', fontSize: 24, color: Colors.white, shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(120, 0, 0, 0),
                            ),
                          ]),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                          backgroundColor:
                              const Color.fromARGB(255, 243, 131, 33),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
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
      if (saved) {
        RecipeViewModel.saveFavoriteRecipe(widget.recipe);
      } else {
        RecipeViewModel.removeFavoriteRecipe(widget.recipe);
      }
      saved = !saved;
    });
  }
}
