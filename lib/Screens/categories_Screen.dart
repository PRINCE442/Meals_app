

import 'package:flutter/material.dart';
import 'package:meals_app/Screens/mealsScreen.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,
   //required this.getFavorites,
    required this.availableMeals});

  //final void Function (Meal meal) getFavorites;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 1.0,
      );

      _animationController.forward();
  }

     @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
         
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals 
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    //Navigator.push(context, route) OR
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
         // getFavorites: getFavorites,
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController,
    child: GridView(
        padding: EdgeInsets.all(14.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0),
        children: [
        
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            ),
        ],
      
      ),
     builder: (context, child) =>
      SlideTransition(position: Tween(
         begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),),
       
      child: child
      ),
   
    
    );
    
  }
}