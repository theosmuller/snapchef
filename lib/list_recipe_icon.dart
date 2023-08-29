import 'package:flutter/material.dart';

class RecipeImageWithStar extends StatelessWidget {
  final String imageUri;
  final double width;
  final double height;
  final bool isFavorite;
  final double starSize;

  RecipeImageWithStar({
    required this.imageUri,
    this.width = 50,
    this.height = 50,
    this.isFavorite = true,
    this.starSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUri,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        if (isFavorite)
          Positioned(
            top: 2,
            right: 2,
            child: Stack(
              children: [
                Container(
                  width: starSize,
                  height: starSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: starSize,
                ),
              ],
            ),
          ),
      ],
    );
  }
}