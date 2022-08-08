import 'package:flutter/material.dart';
import 'package:navigation_app/screens/categories_meals_screen.dart';
import 'package:navigation_app/screens/categories_screen.dart';
import 'package:navigation_app/screens/meal_detail_screen.dart';
import 'package:navigation_app/screens/settings_screen.dart';
import 'package:navigation_app/screens/tabs_screen.dart';
import 'package:navigation_app/utils/app-routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
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
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
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