import 'package:flutter/material.dart';
import 'listpage.dart';

class BottomBar extends StatefulWidget {
  late bool isFavoritesScreen;
  BottomBar({super.key, this.isFavoritesScreen = false});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {

    Color favoritesScreenBottomBarColor = widget.isFavoritesScreen ? Colors.deepOrangeAccent : Colors.white;
    Color searchScreenBottomBarColor = !widget.isFavoritesScreen ? Colors.deepOrangeAccent : Colors.white;
    Color favoritesScreenTextColor = widget.isFavoritesScreen ? Colors.white : Colors.grey.shade800;
    Color searchScreenTextColor = !widget.isFavoritesScreen ? Colors.white : Colors.grey.shade800;

    return SafeArea(
            child: Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the search button
                    _navigateToFavoritesPage(context);
                    print('Search button pressed');
                  },
                  icon: Icon(Icons.search, color: searchScreenTextColor, shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(120, 0, 0, 0),
                    ),
                  ]),
                  label: Text(
                    'Search',
                    style: TextStyle(
                        fontFamily: 'CreteRound',
                        fontSize: 24,
                        color: searchScreenTextColor,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(120, 0, 0, 0),
                          ),
                        ]),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: searchScreenBottomBarColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _navigateToFavoritesPage(context);
                    print('Favorites button pressed');
                  },
                  icon: Icon(Icons.star_border_outlined,
                      color: favoritesScreenTextColor,
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(120, 0, 0, 0),
                        ),
                      ]),
                  label: Text(
                    'Favorites',
                    style: TextStyle(
                        fontFamily: 'CreteRound',
                        fontSize: 24,
                        color: favoritesScreenTextColor,
                        shadows: const [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(120, 0, 0, 0),
                          ),
                        ]),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: favoritesScreenBottomBarColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              )
            ])));
  }

  void _navigateToFavoritesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListPage(isFavorites: !widget.isFavoritesScreen, filter: ""),
      ),
    );
  }
}
