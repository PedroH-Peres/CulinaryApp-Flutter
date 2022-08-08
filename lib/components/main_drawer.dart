import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation_app/utils/app-routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap){
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(label, style: TextStyle(fontFamily: 'Robotocondensed', fontWeight: FontWeight.bold, fontSize: 24),),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {



    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            alignment: Alignment.bottomRight,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor),
              ),
          ),
          SizedBox(height:20 ),
          _createItem(
              Icons.restaurant,
              'Refeições', 
              () => Navigator.of(context).pushNamed(AppRoutes.HOME)
            ),
          _createItem(
              Icons.settings, 
              'Configurações',
              () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS)
            ),
        ],
      ),
    );
  }
}