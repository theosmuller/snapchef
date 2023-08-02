import 'package:flutter/material.dart';

class NextStepButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final IconData iconData;
  final Color iconColor;
  final double fontSize;

  NextStepButton({
    required this.onPressed,
    required this.label,
    required this.backgroundColor,
    required this.iconData,
    this.iconColor = Colors.white,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: SizedBox(),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: 'CreteRound',
                fontSize: fontSize,
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
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Icon(
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
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        ),
      ),
    );
  }
}
