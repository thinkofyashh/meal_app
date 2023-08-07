import 'package:flutter/material.dart';
import 'package:meal_app/Screens/tabs.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/Provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilter[Filter.glutenfree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenfree, isChecked);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only include gluten-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.lactosefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactosefree, isChecked);
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only include Lactose-free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only include Vegetarian meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.vegen]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegen, isChecked);
            },
            title: Text(
              'Vegen',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "only include Vegen meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
