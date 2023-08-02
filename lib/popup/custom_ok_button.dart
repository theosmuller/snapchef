import 'package:flutter/material.dart';

class CustomOkButton extends StatelessWidget {
  final bool checkboxValue;
  final void Function(bool value) onPressed;

  CustomOkButton({
    required this.checkboxValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(checkboxValue);
        Navigator.pop(context, checkboxValue);
      },
      child: Text(
        'OK',
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
        backgroundColor: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      ),
    );
  }
}
