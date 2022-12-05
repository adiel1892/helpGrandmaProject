import 'package:flutter/material.dart';
import 'package:meals_project/dummy_data.dart';
import 'package:meals_project/screens/categories_screen.dart';
import 'package:meals_project/screens/category_activities_screen.dart';
import 'package:meals_project/screens/table_score.dart';
import 'package:meals_project/screens/activity_detail_screen.dart';
import 'package:meals_project/screens/tabs_screen.dart';

import 'models/activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Activity> _availableActivities = DUMMY_ACTIVITIES;
  List<Activity> _favoriteActivities = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteActivities.indexWhere((activity) => activity.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteActivities.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteActivities.add(
            DUMMY_ACTIVITIES.firstWhere((activity) => activity.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteActivities.any((activity) => activity.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: const CategoriesScreen(),
      initialRoute: '/', // default is home - '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoriteActivities),
        CategoryActivitiessScreen.routeName: (ctx) =>
            CategoryActivitiessScreen(_availableActivities),
        ActivityDetailScreen.routeName: (ctx) =>
            ActivityDetailScreen(_toggleFavorite, _isMealFavorite),
        TableScore.routeName: (ctx) => TableScore(),
      },

      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      // },
      // onUnknownRoute: (settings){
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),)
      // } ,
    );
  }
}
