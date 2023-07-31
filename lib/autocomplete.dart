import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';
import 'package:snapchef/listpage.dart';

class AutoCompleteWidget extends StatefulWidget {
  const AutoCompleteWidget({super.key});

  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoCompleteWidget> {
  GlobalKey<AutoCompleteTextFieldState<Recipe>> key = GlobalKey();
  List<Recipe> suggestions = RecipeViewModel.recipes;
  String searchText = "";
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _textEditingController,
            onSubmitted: (value) {
              _filterRecipesAndNavigateToListPage(context, value);
            },
            onChanged: (text) {
              setState(() {
                searchText = text;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'What are we cooking today?',
              hintStyle: const TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _filterRecipesAndNavigateToListPage(context, searchText);
                },
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        AutoCompleteTextField<Recipe>(
          key: key,
          suggestions: suggestions,
          itemBuilder: (context, item) {
            return ListTile(
              title: Text(item.autocompleteterm),
              subtitle: Text(item.country),
              onTap: () {
                _textEditingController.text = item.autocompleteterm;
                _filterRecipesAndNavigateToListPage(
                    context, item.autocompleteterm);
              },
            );
          },
          itemSorter: (a, b) {
            return a.autocompleteterm.compareTo(b.autocompleteterm);
          },
          itemFilter: (item, query) {
            return item.autocompleteterm
                .toLowerCase()
                .contains(query.toLowerCase());
          },
          itemSubmitted: (item) {
            _textEditingController.text = item.autocompleteterm;
            _filterRecipesAndNavigateToListPage(context, item.autocompleteterm);
          },
          textChanged: (text) {
            setState(() {
              searchText = text;
            });
          },
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ],
    );
  }

  void _filterRecipesAndNavigateToListPage(
      BuildContext context, String searchText) {
    List<Recipe> filteredRecipes = suggestions.where((item) {
      return item.autocompleteterm
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(recipes: filteredRecipes),
      ),
    );
  }
}
