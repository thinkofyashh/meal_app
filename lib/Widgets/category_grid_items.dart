import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/items.dart';

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({Key? key, required this.items}) : super(key: key);
  final Items items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        items.color.withOpacity(0.55),
        items.color.withOpacity(0.9),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(
        items.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
