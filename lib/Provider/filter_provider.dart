import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Provider/meal_provider.dart';
enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegen,
}

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier() : super({
    Filter.glutenfree:false,
    Filter.lactosefree:false,
    Filter.vegetarian:false,
    Filter.vegen:false
  });

  void setFilters(Map<Filter,bool> chosenfilter){
    state=chosenfilter;
  }

  void setFilter(Filter filter,bool isActive){
    //state[filter]=isActive is not allowed beacuse here we are mutating the existing values
    state={
      ...state,filter:isActive,
    };
  }
}
final filterProvider=StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref){
  return FilterNotifier();
});
final filtermealProvider=Provider((ref){
  final meals=ref.watch(mealprovider);
  final activefilters=ref.watch(filterProvider);
return meals.where((meal) {
  if (activefilters[Filter.glutenfree]! && !meal.isGlutenFree) {
    return false;
  }
  if (activefilters[Filter.lactosefree]! && !meal.isLactoseFree) {
    return false;
  }
  if (activefilters[Filter.vegen]! && !meal.isVegan) {
    return false;
  }
  if (activefilters[Filter.vegetarian]! && !meal.isVegetarian) {
    return false;
  }
  return true;
}).toList();
});