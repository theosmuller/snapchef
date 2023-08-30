import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Recipe {
  String keyword;
  int id;
  String autocompleteterm;
  String country;
  String image;
  int favorite;

  Recipe({required this.keyword,
    required this.id,
    required this.autocompleteterm,
    required this.country,
    required this.image,
    required this.favorite});

  // factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
  //   return Recipe(
  //       keyword: parsedJson['keyword'] as String,
  //       id: parsedJson['id'],
  //       autocompleteterm: parsedJson['autocompleteterm'] as String,
  //       country: parsedJson['country'] as String,
  //       image: parsedJson['image'] as String);
  // }

  static final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(getDatabasesPath().toString(), 'recipes_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
          'CREATE TABLE recipes(id INTEGER PRIMARY KEY, keyword TEXT, image TEXT, autocompleteterm TEXT, country TEXT, favorite BOOL)'
      );
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
        image: "https://media-cdn.tripadvisor.com/media/photo-s/0e/e2/cf/2e/sorry-but-this-is-not.jpg"
    ),
    Recipe(
        keyword: "Pie",
        id: 2,
        autocompleteterm: "Simple Lemon Pie",
        country: "United States",
        favorite: 1,
        image: "https://static.vecteezy.com/system/resources/previews/021/217/663/non_2x/lemon-pie-food-png.png"
    ),
    Recipe(
        keyword: "Burger",
        id: 3,
        autocompleteterm: "Chickpea and Lentil Burger",
        country: "United States",
        favorite: 1,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-Fmss1O042x_6O78CF0Tof7TjG5eQ-I97IWjdgEooCtWDSfg23z_9g73ig0XqLBGFYjA&usqp=CAU"
    ),
    Recipe(
        keyword: "Soup",
        id: 4,
        autocompleteterm: "Creamy Mushroom Soup",
        country: "France",
        favorite: 1,
        image: "https://www.cookingclassy.com/wp-content/uploads/2022/09/cream-of-mushroom-soup-2.jpg"
    ),
    Recipe(
        keyword: "Tacos",
        id: 4,
        autocompleteterm: "Spicy Beef Tacos",
        country: "Mexico",
        favorite: 1,
        image: "https://danosseasoning.com/wp-content/uploads/2022/03/Beef-Tacos.jpg"
    ),
    Recipe(
        keyword: "Curry",
        id: 5,
        autocompleteterm: "Vegetable Curry",
        country: "India",
        favorite: 1,
        image: "https://greenbowl2soul.com/wp-content/uploads/2021/06/Indian-vegetable-curry.jpg"
    ),
    Recipe(
        keyword: "Burger",
        id: 6,
        autocompleteterm: "Mushroom Swiss Burger",
        country: "United States",
        favorite: 1,
        image: "https://www.jerseygirlcooks.com/wp-content/uploads/2022/06/square-Bubba-burger.jpg"
    ),
    Recipe(
        keyword: "Pizza",
        id: 7,
        autocompleteterm: "Pepperoni Pizza",
        country: "Italy",
        favorite: 1,
        image: "https://www.lakeland.co.uk/inspiration/wp-content/uploads/2020/11/pepperoni-pizza.png"
    ),
    Recipe(
        keyword: "Salad",
        id: 8,
        autocompleteterm: "Greek Salad",
        country: "Greece",
        favorite: 1,
        image: "https://www.wellplated.com/wp-content/uploads/2022/05/Greek-Salad-Recipe-Easy.jpg"
    ),
    Recipe(
        keyword: "Pasta",
        id: 9,
        autocompleteterm: "Garlic Shrimp Pasta",
        country: "Italy",
        favorite: 0,
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOnM61R_al_ChBKZ-24J3Rvddjc9MI0ta6Yw&usqp=CAU"
    ),
    Recipe(
        keyword: "Cake",
        id: 10,
        autocompleteterm: "Chocolate Fudge Cake",
        country: "United States",
        favorite: 0,
        image: "https://del.h-cdn.co/assets/17/16/2048x2048/square-1492693946-108-sein-9781101967140-art-r1-1.jpg"
    ),
    Recipe(
        keyword: "Sushi",
        id: 11,
        autocompleteterm: "Rainbow Sushi Roll",
        country: "Japan",
        favorite: 1,
        image: "https://www.masalaherb.com/wp-content/uploads/2021/01/rainbow-roll-gog-4.jpg"
    ),
    Recipe(
        keyword: "IceCream",
        id: 12,
        autocompleteterm: "Mango Sorbet",
        country: "Thailand",
        favorite: 0,
        image: "https://www.allrecipes.com/thmb/wq15vM26alT2OXYcIFIAxZOv1Cs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8377605-mango-sorbet-MichelleO-4x3-1-40fe0990518f4ae9aac1745de0f6b661.jpg"
    )
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
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'Recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> loadRecipe() async {
    try {
      for (Recipe recipe in baseRecipes) {
        insertRecipe(recipe);
      }
    }
    catch (e) {
      print(e);
    }
  }

  static Future<List<Recipe>> recipesAsync() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The recipes.
    final List<Map<String, dynamic>> maps = await db.query('recipes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image']
      );
    });
  }

  static Future<List<Recipe>> favoritesAsync() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM recipes WHERE favorite == 1");

    // Convert the List<Map<String, dynamic> into a List<Recipe>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image']
      );
    });
  }

  static Future<List<Recipe>> filteredRecipesAsync(String filter) async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The recipes filtered by an autocomplete keyword.
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM recipes WHERE autocompleteterm LIKE \'%$filter%\'");

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image']
      );
    });
  }

  static Future<List<Recipe>> filteredFavoriteRecipesAsync(String filter) async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The recipes filtered by favorites and a autocomplete keyword.
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM recipes WHERE autocompleteterm LIKE \'%$filter%\' AND favorite == 1");
    //query('recipes',where: 'autocompleteterm LIKE %$filter% AND favorite == true');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Recipe(
          id: maps[i]['id'],
          autocompleteterm: maps[i]['autocompleteterm'],
          country: maps[i]['country'],
          favorite: maps[i]['favorite'],
          keyword: maps[i]['keyword'],
          image: maps[i]['image']
      );
    });
  }

  static Future<void> toggleFavorite(int id) async {
    final db = await database;

    final recipe = await db.query('recipes', where: 'id = ?', whereArgs: [id]);
    if (recipe.isNotEmpty) {
      final updatedFavorite = recipe.first['favorite'] == 0 ? 1 : 0;
      await db.update(
        'recipes',
        {'favorite': updatedFavorite},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }
}
