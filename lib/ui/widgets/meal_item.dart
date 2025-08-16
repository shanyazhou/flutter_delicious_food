import 'package:flutter/material.dart';
import 'package:theme2/core/model/meal_model.dart';
import 'operation_item.dart';

class YZMealItem extends StatelessWidget {

  final Meal meal;

  const YZMealItem({
    super.key,
    required this.meal
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: Text(meal.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),),
                  width: 350,
                  height: 30,
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
                YZOperationItem(icon: Icon(Icons.restaurant), name: "难度 ${meal.complexity.toString()}",),
                YZOperationItem(icon: Icon(Icons.favorite), name: "未收藏",),
              ],
            ),
          )
        ],
      ),
    );
  }
}
