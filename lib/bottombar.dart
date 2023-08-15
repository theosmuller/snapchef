import 'package:flutter/material.dart';

import 'listpage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the search button
                    print('Search button pressed');
                  },
                  icon: const Icon(Icons.search, color: Colors.white, shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(120, 0, 0, 0),
                    ),
                  ]),
                  label: const Text(
                    'Search',
                    style: TextStyle(
                        fontFamily: 'CreteRound',
                        fontSize: 24,
                        color: Colors.white,
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
                    backgroundColor: const Color.fromARGB(255, 243, 131, 33),
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
                    // Add functionality for the favorites button
                    _navigateToFavoritesPage(context);
                    print('Favorites button pressed');
                  },
                  icon: Icon(Icons.star_border_outlined,
                      color: Colors.grey[800],
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
                        color: Colors.grey[800],
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
                    backgroundColor: const Color.fromARGB(255, 248, 246, 240),
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
        builder: (context) => ListPage(isFavorites: true),
      ),
    );
  }
}
