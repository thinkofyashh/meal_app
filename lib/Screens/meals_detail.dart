import 'package:flutter/material.dart';
import 'package:meal_app/Provider/filter_provider.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/Provider/favourite_Provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favmeal = ref.watch(favmealprovider);
    final isfav = favmeal.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  // we removed this line of code because now we are using provider
                  // ontogglefav(meal);
                  bool isadded = ref
                      .read(favmealprovider.notifier)
                      .togglemealfavstatus(meal);
                  // adding the snackbar logic here from tab bars
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(isadded
                          ? "Meal is Added to the favourites"
                          : "Meal Removed")));
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns:Tween(begin: 0.8,end: 1.0).animate(animation),
                      child: child,
                    );
                  },
                  child: Icon(
                    isfav ? Icons.star : Icons.star_border,
                    key: ValueKey(isfav),
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Steps',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final steps in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Text(
                    steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
            ],
          ),
        ));
  }
}
