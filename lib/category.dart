import "package:flutter/material.dart";

class Category {
  final String id;
  final String title;
  final Color color;
  final img;

  const Category(
      {@required this.id,
      @required this.title,
      this.img,
      this.color = Colors.orangeAccent});
}
