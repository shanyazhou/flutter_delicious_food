
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../core/model/meal_model.dart';
import 'detail_content.dart';
import '../../../core/viewModel/favor_view_model.dart';

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
      floatingActionButton: Consumer<YZFavorViewModel>(
        builder: (ctx, favorVM, child){
          // 判断当前的食品，是否已经被收藏
          bool isFavor = favorVM.isFavor(meal);

          return FloatingActionButton(
            child: Icon(
              isFavor ? Icons.favorite : Icons.favorite_border,
              color: isFavor ? Colors.red : Colors.black,
            ),
            backgroundColor: Colors.amber,
            onPressed: (){
              if (isFavor) {
                favorVM.removeMeal(meal);
              }else{
                favorVM.addMeal(meal);
              }
            }
          );
        },
      )

      // FloatingActionButton(
      //   child: Icon(Icons.favorite_border,),
      //   backgroundColor: Colors.amber,
      //   onPressed: (){
      //
      //   }
      // )
    );
  }
}
