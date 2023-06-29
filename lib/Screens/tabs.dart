import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Filters.dart';
import 'package:meals_app/Screens/categories_Screen.dart';
import 'package:meals_app/Screens/mealsScreen.dart';
//import 'package:meals_app/data/dummy_data.dart';
//import 'package:meals_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

const kInitialFilters = {
 Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  //final List<Meal> _favoriteMeals = [];
  //Map<Filters, bool> _selectedFilters = kInitialFilters;
   


  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         message,
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       backgroundColor: Colors.brown.shade400,
  //       padding: const EdgeInsets.all(12.0),
  //       elevation: 50,
  //     ),
  //   );
  // }

  // void _getFavoriteMealStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting == true) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage(
  //       'Meal is no longer a favorite',
  //     );
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage('Marked as a favorite');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
     // final results = 
     await Navigator.of(context)
          .push<Map<Filters,bool>>(MaterialPageRoute(builder: 
          (context) => const  FiltersScreen(
           // currentFilters: _selectedFilters,
            ),
          ),);
        //  setState(() {
        //     _selectedFilters = results ?? kInitialFilters; 
        //  }); 
        
    }
  }
              
  @override
  Widget build(BuildContext context) {
   // final meals = ref.watch(mealsProvider);
   // final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      //getFavorites: _getFavoriteMealStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
       // getFavorites: _getFavoriteMealStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
