import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meals.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);

  bool togglemealfavstatus(Meal meal) {
    final mealisfav = state.contains(meal);
    if (mealisfav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favmealprovider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});
