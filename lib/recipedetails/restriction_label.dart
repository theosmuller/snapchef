import 'package:flutter/material.dart';

class RestrictionsLabel extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  RestrictionsLabel({
    required this.label,
    this.width = 100,
    this.height = 20,
  });

  Color _getBackgroundColor() {
    switch (label.toLowerCase()) {
      case 'vegetarian':
        return Colors.lightGreen.shade500;
      case 'vegan':
        return Colors.green;
      case 'gluten-free':
        return Colors.amber.shade700;
      case 'spicy':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
