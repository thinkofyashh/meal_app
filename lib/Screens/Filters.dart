import 'package:flutter/material.dart';
import 'package:meal_app/Screens/tabs.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegen,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key,required this.currentfilter}) : super(key: key);
  final Map<Filter,bool> currentfilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenfreeFilterset = false;
  var lactosefreeFilterset = false;
  var vegetarianFilterset = false;
  var vegenFilterset = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenfreeFilterset=widget.currentfilter[Filter.glutenfree]!;
    lactosefreeFilterset=widget.currentfilter[Filter.lactosefree]!;
    vegenFilterset=widget.currentfilter[Filter.vegen]!;
    vegetarianFilterset=widget.currentfilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      //drawer: MainDrawer(
        //onselectscreen: (identifier) {
          //Navigator.of(context).pop();
          //if (identifier == "Meals") {
            //Navigator.of(context)
              //  .push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
          //}
        //},
      //),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenfree: glutenfreeFilterset,
            Filter.lactosefree: lactosefreeFilterset,
            Filter.vegetarian: vegetarianFilterset,
            Filter.vegen: vegenFilterset
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  glutenfreeFilterset = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only include gluten-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosefreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  lactosefreeFilterset = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only include Lactose-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianFilterset,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFilterset = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only include Vegetarian meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegenFilterset,
              onChanged: (isChecked) {
                setState(() {
                  vegenFilterset = isChecked;
                });
              },
              title: Text(
                'Vegen',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "only include Vegen meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
