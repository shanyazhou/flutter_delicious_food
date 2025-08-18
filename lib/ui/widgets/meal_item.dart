import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme2/core/model/meal_model.dart';
import 'package:theme2/core/viewModel/favor_view_model.dart';
import '../pages/detail/detail.dart';
import 'operation_item.dart';

class YZMealItem extends StatelessWidget {

  final Meal meal;

  const YZMealItem({
    super.key,
    required this.meal
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Center(child: Text(meal.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),
                    width: MediaQuery.of(context).size.width - 30,
                    height: 35,
                  ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  YZOperationItem(icon: Icon(Icons.schedule), name: "${meal.duration.toString()} min",),
                  YZOperationItem(icon: Icon(Icons.restaurant), name: "难度 ${meal.complexityString}",),

                  Consumer<YZFavorViewModel>(
                    builder: (ctx, favorVM, child){
                      return GestureDetector(
                        child: YZOperationItem(
                          icon: Icon(
                            favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border,
                            color: favorVM.isFavor(meal) ? Colors.red : Colors.black,
                          ),
                          name: favorVM.isFavor(meal) ? "已收藏" : "未收藏",
                        ),
                        onTap: (){
                          if (favorVM.isFavor(meal)) {
                            favorVM.removeMeal(meal);
                          }else{
                            favorVM.addMeal(meal);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(YZDetailScreen.routeName, arguments: meal);
      },
    );
  }
}
