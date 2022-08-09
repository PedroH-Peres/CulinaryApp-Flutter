import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation_app/components/main_drawer.dart';
import 'package:navigation_app/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChange;
  final Settings settings;
  const SettingsScreen(this.onSettingsChange, this.settings);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value, Function(bool) onChanged){
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value, 
      onChanged: (value){
        onChanged(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Configurações')),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Configurações', style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'Apenas refeições sem glúten',
                  settings.isGLutenFree,
                  (value) => setState(()=> settings.isGLutenFree = value)
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Apenas refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(()=> settings.isLactoseFree = value)
                ),
                _createSwitch(
                  'Vegana',
                  'Apenas refeições veganas',
                  settings.isVegan,
                  (value) => setState(()=> settings.isVegan = value)
                ),
                _createSwitch(
                  'Vegetariana',
                  'Apenas refeições vegetarianas.',
                  settings.isVegetarian,
                  (value) => setState(()=> settings.isVegetarian = value)
                )
              ],
            )
          ),
        ],
      )
    );
  }
}