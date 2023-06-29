import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal,
   //required this.getFavorites
   });

  final Meal meal;
 // final void Function (Meal meal) getFavorites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () {
          final wasAdded =  ref
            .read(favoriteMealsProvider.notifier)
            . getMealFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
         wasAdded ? 'Meal has been added as a favorite' : 'Meal has been removed as favorite',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown.shade400,
        padding: const EdgeInsets.all(12.0),
        elevation: 50,
      ),
    );
            }, 
           
          icon: 
          AnimatedSwitcher(duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return RotationTransition(turns: Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(animation), 
            child: child, );
          },
          child: Icon(isFavorite ? Icons.star : Icons.star_border, key: ValueKey(isFavorite),), 
          ),
          
          disabledColor: Colors.blue, ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingridients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical:12 ,horizontal: 12 ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    

                    
                ),
              ),
          ],
        ),
      ),
    );
  }
}
