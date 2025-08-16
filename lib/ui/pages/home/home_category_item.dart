import 'package:flutter/material.dart';
import 'package:theme2/core/model/category_model.dart';
import 'package:theme2/ui/pages/meal/meal.dart';

class YZHomeCategoryItem extends StatelessWidget {

  final YZCategoryModel categoryItem;

  YZHomeCategoryItem({
    super.key,
    required this.categoryItem,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = categoryItem.bgColor;

    return GestureDetector(
      child: Container(
      decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [
                    bgColor!.withOpacity(0.5),
                    bgColor!,
                  ]
              )
          ),
      
          child: Center(child:
          Text("${categoryItem.title}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
          )
      ),
      onTap: (){
        Navigator.of(context).pushNamed(YZMealScreen.routeName, arguments: categoryItem);
      },
    );;
  }
}
