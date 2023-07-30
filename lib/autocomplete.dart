import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:snapchef/recipe.dart';
// ignore: use_key_in_widget_constructors
class AutoComplete extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AutoCompleteState createState() => _AutoCompleteState();

  
}

class _AutoCompleteState extends State<AutoComplete> {

  _AutoCompleteState();
  
  GlobalKey<AutoCompleteTextFieldState<Recipe>> key = GlobalKey();
  Recipe? selected;
  List<Recipe> suggestions = RecipeViewModel.recipes;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Auto Complete List Demo'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Column(children: <Widget>[
            AutoCompleteTextField<Recipe>(
                itemSubmitted: (item) => setState(() => selected = item),
                key: key,
                suggestions: suggestions,
                itemBuilder: (context, item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(item.autocompleteterm,
                      style: const TextStyle(
                        fontSize: 16.0
                      ),),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Text(item.country,
                      )
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
                    suffixIcon: SizedBox(
                      width: 85.0,
                      height: 60.0,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    filled: true,
                    hintText: 'What are we cooking today?',
                    hintStyle: TextStyle(
                        color: Colors.black))) //AutoCompleteTextField code here
          ]),
        ])));
  }
}
