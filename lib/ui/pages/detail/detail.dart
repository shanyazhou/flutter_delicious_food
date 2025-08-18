
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/model/meal_model.dart';
import 'detail_content.dart';

class YZDetailScreen extends StatelessWidget {
  static const routeName = "/detail";
  const YZDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: YZDetailContent(meal: meal,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_border,),
        backgroundColor: Colors.amber,
        onPressed: (){

        }
      )
    );
  }
}
