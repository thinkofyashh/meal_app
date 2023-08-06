import 'package:flutter/material.dart';
import 'package:meal_app/Screens/meal.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/Widgets/category_grid_items.dart';
import 'package:meal_app/models/items.dart';
import 'package:meal_app/models/meals.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key,required this.availableMeal}) : super(key: key);
  final List<Meal> availableMeal;

  void _selectCategory(BuildContext context,Items items) {
    final filteredList=availableMeal.where((meal)=>meal.categories.contains(items.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              meals:filteredList,
              title:items.title,
            )));
    // Navigation.push(context,route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final items in availableCategories)
            CategoryGridItems(items: items,onSelect: (){_selectCategory(context,items);},)
        ],
    );
  }
}
