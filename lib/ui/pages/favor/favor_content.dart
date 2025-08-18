import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme2/core/viewModel/favor_view_model.dart';

import '../../widgets/meal_item.dart';

class YZFavorContent extends StatelessWidget {
  const YZFavorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<YZFavorViewModel>(
      builder: (ctx, favorVM, child){

        if (favorVM.favorMeals.length == 0) {
          return Center(
            child: Text("未收藏美食~"),
          );
        }

        return ListView.builder(
          itemCount: favorVM.favorMeals.length,
          itemBuilder: (BuildContext context, int index){
            return YZMealItem(meal: favorVM.favorMeals[index]);
          }
        );
      },
    );
  }
}
