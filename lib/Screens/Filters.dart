import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/Screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

// enum Filters {
//   lactoseFree,
//   glutenFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key, 
  //required this.currentFilters
  });
  //final Map<Filters, bool>  currentFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreemState();
// }

// class _FiltersScreemState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterset = false;
//   var _lactoseFreeFilterset = false;
//   var _veganFilterset = false;
//   var _vegetarianFilterset = false;

  // @override
  // void initState() {
  //   super.initState();
  //   final activeFIilters = ref.read(filtersProvider);
  //   _glutenFreeFilterset = activeFIilters[Filters.glutenFree]!;
  //    _lactoseFreeFilterset = activeFIilters[Filters.lactoseFree]!;
  //     _veganFilterset = activeFIilters[Filters.vegan]!;
  //      _vegetarianFilterset = activeFIilters[Filters.vegetarian]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      //   drawer: MainDrawer(onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      // if (identifier == 'Meals') {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const TabsScreen(),),);
      // }
      //   }),
      body:
      //  WillPopScope(
      //   onWillPop: () async {
      //     ref.read(filtersProvider.notifier).setFilters({
      //        Filters.glutenFree : _glutenFreeFilterset,
      //       Filters.lactoseFree: _lactoseFreeFilterset,
      //       Filters.vegan: _veganFilterset,
      //       Filters.vegetarian: _vegetarianFilterset,
      //   });
      //    // Navigator.of(context).pop( );
           
         
      //     return true;
      //   },
         Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree]!,
              //_glutenFreeFilterset,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, isChecked);
                // setState(() {
                //   _glutenFreeFilterset = isChecked;
                // });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 24),
            ),
          ],
        ),
    );
  }
}
