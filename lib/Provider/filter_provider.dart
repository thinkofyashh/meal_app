import 'package:flutter_riverpod/flutter_riverpod.dart';
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