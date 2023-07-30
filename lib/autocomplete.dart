import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';

class AutoCompleteWidget extends StatefulWidget {
  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoCompleteWidget> {
  GlobalKey<AutoCompleteTextFieldState<Recipe>> key = GlobalKey();
  Recipe? selected;
  List<Recipe> suggestions = RecipeViewModel.recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 300, // Set the desired width here
          padding: const EdgeInsets.symmetric(
              horizontal: 16), // Add horizontal padding
          decoration: BoxDecoration(
            color: Colors.grey[200], // Set the background color
            borderRadius: BorderRadius.circular(20), // Set the border radius
          ),
          child: AutoCompleteTextField<Recipe>(
            itemSubmitted: (item) => setState(() => selected = item),
            key: key,
            suggestions: suggestions,
            itemBuilder: (context, item) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        // Wrap this Expanded widget around the Text
                        child: Text(
                          item.autocompleteterm,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Text(item.country),
                    ],
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.1), // Set the line color with transparency
                    thickness: 0.5, // Set the line thickness
                  ),
                ],
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
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
            decoration: const InputDecoration(
              border: InputBorder.none, // Remove the default border
              hintText: 'What are we cooking today?',
              hintStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
