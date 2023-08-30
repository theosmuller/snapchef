import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Recipe {
  String keyword;
  int id;
  String autocompleteterm;
  String country;
  String image;
  int favorite;
  List<RecipeStep> steps;

  Recipe(
      {required this.keyword,
      required this.id,
      required this.autocompleteterm,
      required this.country,
      required this.image,
      required this.favorite,
      required this.steps});

  static final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(getDatabasesPath().toString(), 'recipes_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      db.execute(
          'CREATE TABLE recipes(id INTEGER PRIMARY KEY, keyword TEXT, image TEXT, autocompleteterm TEXT, country TEXT, favorite BOOL)');
      db.execute('''
    CREATE TABLE recipe_steps (
      id INTEGER PRIMARY KEY,
      recipe_id INTEGER,
      step_index INTEGER,
      ingredients TEXT,
      description TEXT,
      image TEXT,
      FOREIGN KEY (recipe_id) REFERENCES recipes (id)
    )''');
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  static final List<Recipe> baseRecipes = [
    Recipe(
        keyword: "Not",
        id: 1,
        autocompleteterm: "Not-a-pie",
        country: "Honduras",
        favorite: 0,
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg",
        steps: [
          RecipeStep(
            id: 1,
            recipeId: 1,
            stepIndex: 1,
            ingredients: "1 tbsp oil, 1 pound of beef",
            description: "Heat oil in a large pot over medium-high heat. Add beef and cook until browned on all sides, about 10 minutes; remove meat and set aside.",
            image: "https://www.allrecipes.com/thmb/XJ33a_9S1tvIIN-MfTZyOPSbr9Y=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/15431-BeefandVegetableStew-DDMFS-036-step2-4bf4cc69099a4c1d8c8f8153340db6be.jpg"
          ),
          RecipeStep(
            id: 2,
            recipeId: 1,
            stepIndex: 2,
            ingredients: "1 onion thinly sliced, 1 can of tomato paste, ",
            description: "Add onion and tomato paste to the same pot; cook and stir until onion is tender, about 5 minutes.",
            image: "https://www.allrecipes.com/thmb/TFJn1_bSrbnUm375zQ9BMH6aW-Y=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/15431-BeefandVegetableStew-DDMFS-037-step3-c8d3844f326842a2a0350049143f89bc.jpg"
          ),
          RecipeStep(
            id: 3,
            recipeId: 1,
            stepIndex: 3,
            ingredients: "all previous ingredients",
            description: "Return beef to the pot; stir in beef broth. Reduce heat to low, cover, and simmer until meat is tender, about 1 to 1 1/2 hours.",
            image: "https://www.allrecipes.com/thmb/vn4BOF5Wb_RUISwB_RNiMyCvVME=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/15431-BeefandVegetableStew-DDMFS-039-step5-39d10b2c07d749cba152d86b723044f7.jpg"
          ),
          RecipeStep(
            id: 4,
            recipeId: 1,
            stepIndex: 4,
            ingredients: "3 potatoes (cubed), 1 cup chopped carrots, 1 teaspoon dried thyme, 1/4 teaspoon crushed red pepper flakes, 1 sprig fresh rosemary, 1 bay leaf, water",
            description: "Add potatoes, carrots, thyme, crushed red pepper flakes, rosemary, and bay leaf; simmer, covered, for 45 minutes, adding some water if stew gets too thick.",
            image: "https://www.allrecipes.com/thmb/44L9WKg381ItGsOh5kjnNvM6FAg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/15431-BeefandVegetableStew-DDMFS-040-step6-44f77d8d687a4e878fcbf23bb180528f.jpg"
          ),
        ],),

    Recipe(
        keyword: "Pie",
        id: 2,
        autocompleteterm: "Simple Lemon Pie",
        country: "United States",
        favorite: 1,
        steps: [],
        image:
            "https://static.vecteezy.com/system/resources/previews/021/217/663/non_2x/lemon-pie-food-png.png"),
    Recipe(
        keyword: "Burger",
        id: 3,
        autocompleteterm: "Chickpea and Lentil Burger",
        country: "United States",
        favorite: 1,
        steps: [],
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-Fmss1O042x_6O78CF0Tof7TjG5eQ-I97IWjdgEooCtWDSfg23z_9g73ig0XqLBGFYjA&usqp=CAU"),
    Recipe(
        keyword: "Soup",
        id: 4,
        autocompleteterm: "Creamy Mushroom Soup",
        country: "France",
        favorite: 1,
        steps: [],
        image:
            "https://www.cookingclassy.com/wp-content/uploads/2022/09/cream-of-mushroom-soup-2.jpg"),
    Recipe(
        keyword: "Tacos",
        id: 4,
        autocompleteterm: "Spicy Beef Tacos",
        country: "Mexico",
        favorite: 1,
        steps: [],
        image:
            "https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg"),
    Recipe(
        keyword: "Curry",
        id: 5,
        autocompleteterm: "Vegetable Curry",
        country: "India",
        favorite: 1,
        steps: [],
        image:
            "https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg"),
    Recipe(
        keyword: "Burger",
        id: 6,
        autocompleteterm: "Mushroom Swiss Burger",
        country: "United States",
        favorite: 1,
        steps: [],
        image:
            "https://www.jerseygirlcooks.com/wp-content/uploads/2022/06/square-Bubba-burger.jpg"),
    Recipe(
        keyword: "Pizza",
        id: 7,
        autocompleteterm: "Pepperoni Pizza",
        country: "Italy",
        favorite: 1,
        steps: [],
        image:
            "https://www.lakeland.co.uk/inspiration/wp-content/uploads/2020/11/pepperoni-pizza.png"),
    Recipe(
        keyword: "Salad",
        id: 8,
        autocompleteterm: "Greek Salad",
        country: "Greece",
        favorite: 1,
        steps: [],
        image:
            "https://www.wellplated.com/wp-content/uploads/2022/05/Greek-Salad-Recipe-Easy.jpg"),
    Recipe(
        keyword: "Pasta",
        id: 9,
        autocompleteterm: "Garlic Shrimp Pasta",
        country: "Italy",
        favorite: 0,
        steps: [],
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOnM61R_al_ChBKZ-24J3Rvddjc9MI0ta6Yw&usqp=CAU"),
    Recipe(
        keyword: "Cake",
        id: 10,
        autocompleteterm: "Chocolate Fudge Cake",
        country: "United States",
        favorite: 0,
        steps: [],
        image:
            "https://del.h-cdn.co/assets/17/16/2048x2048/square-1492693946-108-sein-9781101967140-art-r1-1.jpg"),
    Recipe(
        keyword: "Sushi",
        id: 11,
        autocompleteterm: "Rainbow Sushi Roll",
        country: "Japan",
        favorite: 1,
        steps: [],
        image:
            "https://www.masalaherb.com/wp-content/uploads/2021/01/rainbow-roll-gog-4.jpg"),
    Recipe(
        keyword: "IceCream",
        id: 12,
        autocompleteterm: "Mango Sorbet",
        country: "Thailand",
        favorite: 0,
        steps: [],
        image:
            "https://www.allrecipes.com/thmb/wq15vM26alT2OXYcIFIAxZOv1Cs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8377605-mango-sorbet-MichelleO-4x3-1-40fe0990518f4ae9aac1745de0f6b661.jpg")
  ];

  Map<String, dynamic> toJson() {
    return {
      'keyword': keyword,
      'id': id,
      'autocompleteterm': autocompleteterm,
      'country': country,
      'image': image,
      'favorite': favorite
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'keyword': keyword,
      'id': id,
      'autocompleteterm': autocompleteterm,
      'country': country,
      'image': image,
      'favorite': favorite
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Recipe: {id: $id, keyword: $keyword, autocompleteterm: $autocompleteterm, country: $country, image: $image, favorite: $favorite}';
  }

  static Future<void> insertRecipe(Recipe recipe) async {
    final db = await database;

    // Insert the recipe and get its ID
    final recipeId = await db.insert(
      'recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Insert associated steps with the obtained recipe ID
    for (RecipeStep step in recipe.steps) {
      await db.insert(
        'recipe_steps',
        {
          'recipe_id': recipeId,
          'step_index': step.stepIndex,
          'ingredients': step.ingredients,
          'description': step.description,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<void> loadRecipe() async {
    try {
      for (Recipe recipe in baseRecipes) {
        insertRecipe(recipe);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Recipe>> recipesAsync() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('recipes');

    // Fetch recipe steps for each recipe
    final recipes = await Future.wait(maps.map((map) async {
      final recipeId = map['id'];
      final steps = await loadRecipeSteps(recipeId);
      return Recipe(
        id: map['id'],
        autocompleteterm: map['autocompleteterm'],
        country: map['country'],
        favorite: map['favorite'],
        keyword: map['keyword'],
        image: map['image'],
        steps: map['steps'],
      );
    }));

    return recipes;
  }

  static Future<List<Recipe>> favoritesAsync() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM recipes WHERE favorite == 1");

    // Convert the List<Map<String, dynamic> into a List<Recipe>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image'],
          steps: steps[i]['steps']););
    });
  }

  static Future<List<Recipe>> filteredRecipesAsync(String filter) async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The recipes filtered by an autocomplete keyword.
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM recipes WHERE autocompleteterm LIKE \'%$filter%\'");

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image'],
          steps: steps[i]['steps']);
    });
  }

  static Future<List<Recipe>> filteredFavoriteRecipesAsync(String filter) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM recipes WHERE autocompleteterm LIKE \'%$filter%\' AND favorite == 1");

    // Fetch recipe steps for each recipe
    final recipes = await Future.wait(maps.map((map) async {
      final recipeId = map['id'];
      final steps = await loadRecipeSteps(recipeId);
      return Recipe(
        id: map['id'],
        autocompleteterm: map['autocompleteterm'],
        country: map['country'],
        favorite: map['favorite'],
        keyword: map['keyword'],
        image: map['image'],
        steps: steps,
      );
    }));

    return recipes;
  }

  static Future<List<RecipeStep>> loadRecipeSteps(int recipeId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'recipe_steps',
      where: 'recipe_id = ?',
      whereArgs: [recipeId],
    );

    return List.generate(maps.length, (i) {
      return RecipeStep(
        id: maps[i]['id'],
        recipeId: maps[i]['recipe_id'],
        stepIndex: maps[i]['step_index'],
        ingredients: maps[i]['ingredients'],
        description: maps[i]['description'],
        image: maps[i]['image'],
      );
    });
  }
}

class RecipeStep {
  int id; // Unique ID for the step
  int recipeId; // ID of the associated recipe
  int stepIndex; // Step index (1, 2, 3, ...)
  String ingredients; // Ingredients used in the step
  String description; // Description of the step
  String image;

  RecipeStep({
    required this.id,
    required this.recipeId,
    required this.stepIndex,
    required this.ingredients,
    required this.description,
    required this.image,
  });
}