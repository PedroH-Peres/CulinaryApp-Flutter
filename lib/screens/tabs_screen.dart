import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation_app/components/main_drawer.dart';
import 'package:navigation_app/screens/categories_screen.dart';
import 'package:navigation_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen(),},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen(),}
  ];

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos'
          ),
        ]
      ),
    );
  }
}