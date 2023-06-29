import 'package:flutter/material.dart';

class  Category {
 const Category(
      {required String this.id,
      required String this.title,
      this.color = Colors.orange});

  final String id;
  final String title;
  final Color color;
}
