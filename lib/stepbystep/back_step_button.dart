import 'package:flutter/material.dart';

class BackStepButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData iconData;
  final Color iconColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  BackStepButton({
    required this.onPressed,
    required this.label,
    required this.iconData,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.deepOrangeAccent,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 24,
          color: iconColor,
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
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: padding,
        ),
      ),
    );
  }
}
