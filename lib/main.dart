import 'package:flutter/material.dart';
import 'package:navigation_app/screens/categories_meals_screen.dart';
import 'package:navigation_app/screens/categories_screen.dart';
import 'package:navigation_app/screens/meal_detail_screen.dart';
import 'package:navigation_app/screens/settings_screen.dart';
import 'package:navigation_app/screens/tabs_screen.dart';
import 'package:navigation_app/utils/app-routes.dart';
import 'data/dummy_data.dart';

import 'models/meal.dart';
import 'models/settings.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal){
        final filterGluten = (settings.isGLutenFree && meal.isGlutenFree == false);
        final filterLactose = settings.isLactoseFree && meal.isLactoseFree == false;
        final filterVegan = settings.isVegan && meal.isVegan == false;
        final filterVegetarian = settings.isVegetarian && meal.isVegetarian == false;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;

      }).toList();
    });
  }

  void _toggleFavorite(Meal meal){
    setState(() {
      _favoriteMeals.contains(meal) 
      ? _favoriteMeals.remove(meal) 
      : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        )  ,
        fontFamily: 'Raleway',
        canvasColor: Color.fromARGB(255, 254, 233, 254),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')
        )
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}