import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles();

  static const TextStyle movieCardTitle = TextStyle(
    color: Colors.white,
    fontSize: 11,
    height: 0.7,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle movieCardDescription = TextStyle(
    textBaseline: TextBaseline.alphabetic,
    wordSpacing: 0.10,
    letterSpacing: 0.10,
    color: Colors.white,
    fontSize: 11,
    height: 1.3,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle movieScore = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 0.7);
}
