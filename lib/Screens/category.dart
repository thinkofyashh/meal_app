import 'package:flutter/material.dart';
import 'package:meal_app/Screens/meal.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/Widgets/category_grid_items.dart';
import 'package:meal_app/models/items.dart';
import 'package:meal_app/models/meals.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.availableMeal}) : super(key: key);
  final List<Meal> availableMeal;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  void _selectCategory(BuildContext context, Items items) {
    final filteredList = widget.availableMeal
        .where((meal) => meal.categories.contains(items.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              meals: filteredList,
              title: items.title,
            )));
    // Navigation.push(context,route);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final items in availableCategories)
              CategoryGridItems(
                items: items,
                onSelect: () {
                  _selectCategory(context, items);
                },
              )
          ],
        ),
        builder: (context, child) => //Padding(
            // padding: EdgeInsets.only(top: 100-animationController.value * 100),
            //child: child,)
            SlideTransition(
              position: Tween(
                      begin: const Offset(0.0, 0.3),
                      end: const Offset(0.0, 0.0))
                  .animate(CurvedAnimation(
                      parent: animationController, curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
