import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {

  _createSectionTitle(BuildContext context, String title){
    return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(title, style: Theme.of(context).textTheme.headline6,),
            );
  }

  Widget _createSectionContainer(Widget child){
    return Container(
              width: 320,
              height: 220,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: child
            );
  }

  @override
  Widget build(BuildContext context) {
    final meal = (ModalRoute.of(context)!.settings.arguments) as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl!, fit: BoxFit.cover)
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index){
                  return Card(
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: Text(meal.ingredients[index]!)
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index+1}'),
                        ),
                        title: Text(meal.steps![index] as String),
                        ),
                        Divider(color: Colors.black,)
                    ],
                  );
                  }
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}