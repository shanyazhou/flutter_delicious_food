import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme2/core/model/category_model.dart';
import 'package:theme2/core/model/meal_model.dart';
import 'package:theme2/core/router/router.dart';
import 'package:theme2/core/viewModel/meal_view_model.dart';
import 'package:theme2/ui/widgets/meal_item.dart';
import 'meal_content.dart';
import 'package:collection/collection.dart';

class YZMealContent extends StatelessWidget {
  const YZMealContent({super.key});

  @override
  Widget build(BuildContext context) {

    // 获取参数
    final category = ModalRoute.of(context)?.settings.arguments as YZCategoryModel;

    return Selector<YZMealViewModel, List<Meal>>(

        selector: (ctx, mealVM) => mealVM.meals,
        shouldRebuild: (previous, next){
            return ! ListEquality().equals(previous, next);
        },// 是否需要重新build
        builder: (context, meals, child){
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (BuildContext context, int index){
              return YZMealItem(meal: meals[index]);
            }
          );
        },
    );
  }
}

/// 使用Consumer
// class YZMealContent extends StatelessWidget {
//   const YZMealContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     // 获取参数
//     final category = ModalRoute.of(context)?.settings.arguments as YZCategoryModel;
//
//     return Consumer<YZMealViewModel>(
//         builder: (ctx, mealVM, chid) {
//           print(mealVM);
//           final meals = mealVM.meals;
//           return ListView.builder(
//               itemCount: meals.length,
//               itemBuilder: (BuildContext context, int index){
//                 return ListTile(
//                   title: Text("${meals[index].title}"),
//                 );
//               }
//           );
//           // Text("${mealVM.meals.length}");
//         }
//     );
//   }
// }

