import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Filters.dart';
import 'package:meal_app/Screens/category.dart';
import 'package:meal_app/Screens/meal.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Provider/meal_provider.dart';
import 'package:meal_app/Provider/favourite_Provider.dart';
import 'package:meal_app/Provider/filter_provider.dart';

const kinitialfilter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegetarian: false,
  Filter.vegen: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  // when riverpod is added we canget rid of this code.
  //final List<Meal> favmeal = [];
 // Map<Filter, bool> selectedfilter =kinitialfilter;

  void onselect(String identifiers) async {
    Navigator.of(context).pop();
    if (identifiers == "Filters") {
      // because we have now a provider to manage the filter state.
    //  final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FilterScreen());
     // print(result);
     // setState(() {
       // selectedfilter = result
        //?? kinitialfilter;
      //});
    }
  }
// now we will also move this method to the mealdetail screen.
  //void showinMessage(String msg) {
    //ScaffoldMessenger.of(context).clearSnackBars();
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  //}

  // this function add a meal into favmeal if the meal is not there in the favmeal list.
  // and remove the meal if there exist the same meal in the favmeal list.
  // when river pod is added we can get rid of this code
  /*void togglemeal(Meal meal) {
    final isExisting = favmeal.contains(meal);
    if (isExisting) {
      setState(() {
        favmeal.remove(meal);
      });
      showinMessage("Meal is no longer a favorite");
    } else {
      setState(() {
        favmeal.add(meal);
        showinMessage('Marked as favourite');
      });
    }
  }*/

  int _selectedpageindex = 0;

  void selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   final meals= ref.watch(mealprovider);
   final activefilters=ref.watch(filterProvider);
    final availablemeals=meals.where((meal){
      if(activefilters[Filter.glutenfree]! && !meal.isGlutenFree){
        return false;
      }
      if(activefilters[Filter.lactosefree]! && !meal.isLactoseFree){
        return false;
      }
      if(activefilters[Filter.vegen]! && !meal.isVegan){
        return false;
      }
      if(activefilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
    Widget activepage = Categories(
      availableMeal:availablemeals,
    );
    var activepagetitle = 'Pick Your Category';
    if (_selectedpageindex == 1) {
      final favmealproviders=ref.watch(favmealprovider);
      activepage = MealsScreen(
        meals: favmealproviders,
      );
      activepagetitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(
        onselectscreen: onselect,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedpageindex,
        onTap: selectpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favorites')
        ],
      ),
    );
  }
}
