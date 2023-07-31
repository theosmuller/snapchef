import 'package:flutter/material.dart';
import 'package:snapchef/autocomplete.dart';
import 'package:snapchef/listpage.dart';
import 'package:snapchef/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapChef',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 243, 131, 33)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SnapChef Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _loadData() async {
    await RecipeViewModel.loadRecipe();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo image slightly above center
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    'logo.png', // Replace with your logo image path
                  ),
                ),
              ),
              // Text in the center
              AutoCompleteWidget(),
              const SizedBox(height: 10),
              // Two large rectangular interactable buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Add functionality for the search button
                              print('Search button pressed');
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('Search'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color.fromARGB(255, 243, 131, 33),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Add functionality for the favorites button
                              _navigateToFavoritesPage(context);
                              print('Favorites button pressed');
                            },
                            icon: const Icon(Icons.star_border_outlined),
                            label: const Text('Favorites'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                              backgroundColor: const Color.fromARGB(255, 248, 246, 240),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
    
    
  }
  void _navigateToFavoritesPage(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListPage(recipes: RecipeViewModel.favorites),
        ),
      );
    }
  
}
