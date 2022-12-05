import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/activity_item.dart';

class GalleryScreen extends StatelessWidget {
  final List<Activity> favoriteMeals;

  GalleryScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no photos yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return ActivityItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].urgency,
            duration: favoriteMeals[index].duration,
            score: favoriteMeals[index].score,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
