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
    IconData isFilledStarIcon = isFavorite ? Icons.star_rounded : Icons.star_border_rounded;
    return Stack(
      children: [
        Image.network(
          imageUri,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Icon(
            isFilledStarIcon,
            color: isFavorite ? Colors.amber : Colors.white,
            size: starSize,
          ),
        ),
      ],
    );
  }
}