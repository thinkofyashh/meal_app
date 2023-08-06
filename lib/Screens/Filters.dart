import 'package:flutter/material.dart';
import 'package:meal_app/Screens/tabs.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/Provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var glutenfreeFilterset = false;
  var lactosefreeFilterset = false;
  var vegetarianFilterset = false;
  var vegenFilterset = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activefilter = ref.read(filterProvider);
    // glutenfreeFilterset=widget.currentfilter[Filter.glutenfree]!;
    glutenfreeFilterset = activefilter[Filter.glutenfree]!;
    lactosefreeFilterset = activefilter[Filter.lactosefree]!;
    vegenFilterset = activefilter[Filter.vegen]!;
    vegetarianFilterset = activefilter[Filter.vegetarian]!;
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
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
              Filter.glutenfree: glutenfreeFilterset,
              Filter.lactosefree: lactosefreeFilterset,
              Filter.vegetarian: vegetarianFilterset,
              Filter.vegen: vegenFilterset});

         // Navigator.of(context).pop({
          //  Filter.glutenfree: glutenfreeFilterset,
            //Filter.lactosefree: lactosefreeFilterset,
            //Filter.vegetarian: vegetarianFilterset,
            //Filter.vegen: vegenFilterset
         // });
          //return false;
          // prev we are manually using pop now we will make the return to true to do it automatically.
          return true;
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
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              subtitle: Text(
                "only include gluten-free meals.",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              subtitle: Text(
                "only include Lactose-free meals.",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              subtitle: Text(
                "only include Vegetarian meals.",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
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
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              subtitle: Text(
                "only include Vegen meals.",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onBackground),
              ),
              activeColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
