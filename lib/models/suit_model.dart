import 'package:flutter/material.dart';

class Suit {
  final List<String> imagePaths;
  final String name;
  final String description;
  final List<Color> colors;

  Suit({
    required this.imagePaths,
    required this.name,
    required this.description,
    required this.colors,
  });
}
