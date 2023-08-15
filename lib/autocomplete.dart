import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:snapchef/recipe/recipe.dart';
import 'package:snapchef/listpage.dart';

class AutoCompleteWidget extends StatefulWidget {
  // final bool
  //     favorites; // TEM QUE PASSAR ISSO NA PAGINA Q DESENHA O WIDGET E PASSAR PRO NAVIGATE DESSA CLASSE
  const AutoCompleteWidget({super.key, /*required this.favorites*/});

  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoCompleteWidget> {
  GlobalKey<AutoCompleteTextFieldState<Recipe>> key = GlobalKey();
  String searchText = "";
//  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Recipe.recipesAsync(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(children: <Widget>[
              Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Loading recipes"))
            ]);
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(children: <Widget>[
                Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Autocomplete<String>(optionsBuilder:
                        (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return snapshot.data!.map((recipe) => recipe
                              .autocompleteterm
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase())
                          ? recipe.autocompleteterm
                          : '');
                    }, onSelected: (value) {
                      _filterRecipesAndNavigateToListPage(context, value);
                    }, fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What are we cooking today?',
                          hintStyle: const TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              _filterRecipesAndNavigateToListPage(
                                  context, controller.text);
                            },
                          ),
                        ),
                        onSubmitted: (value) {
                          _filterRecipesAndNavigateToListPage(context, value);
                        },
                      );
                    }))
              ]);
            }
          }
        });
  }

// ,
//
// )
//
// ,

// AutoCompleteTextField<Recipe>(
//   key: key,
//   suggestions: suggestions,
//   itemBuilder: (context, item) {
//     return Listener(
//       child: ListTile(
//         title: Text(item.autocompleteterm),
//         subtitle: Text(item.country),
//         onTap: () {
//           _textEditingController.text = item.autocompleteterm;
//           _filterRecipesAndNavigateToListPage(
//               context, item.autocompleteterm);
//         },
//       ),
//       onPointerDown: (s) {
//         _textEditingController.text = item.autocompleteterm;
//       },
//     );
//   },
//   itemSorter: (a, b) {
//     return a.autocompleteterm.compareTo(b.autocompleteterm);
//   },
//   itemFilter: (item, query) {
//     return item.autocompleteterm
//         .toLowerCase()
//         .contains(query.toLowerCase());
//   },
//   itemSubmitted: (item) {
//     _textEditingController.text = item.autocompleteterm;
//     _filterRecipesAndNavigateToListPage(context, item.autocompleteterm);
//   },
//   textChanged: (text) {
//     setState(() {
//       searchText = text;
//     });
//   },
//   style: const TextStyle(color: Colors.black, fontSize: 16.0),
// ),
// ]
//
// ,
//
// );
// }

  void _filterRecipesAndNavigateToListPage(
      BuildContext context, String searchText) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(isFavorites: false, filter: searchText),
      ),
    );
  }
}
