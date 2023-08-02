import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData iconData;
  final Color backgroundColor;

  FavoriteButton({
    required this.label,
    required this.onPressed,
    required this.iconData,
    this.backgroundColor = const Color.fromARGB(255, 243, 131, 33),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
              color: Color.fromARGB(120, 0, 0, 0),
            ),
          ],
        ),
        label: Text(
          label,
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
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
