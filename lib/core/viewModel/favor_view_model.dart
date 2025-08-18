import 'package:flutter/cupertino.dart';
import 'package:theme2/core/model/meal_model.dart';

class YZFavorViewModel extends ChangeNotifier{
  List<Meal> _favorMeals = [];

  // 创建一个meals的get方法，这样私有变量可以通过get方法去访问，而不能修改
  List<Meal> get favorMeals {
    return _favorMeals;
  }

  void addMeal(Meal meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(Meal meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  /// 判断某个菜品是否已经被收藏
  bool isFavor(Meal meal){
    return _favorMeals.contains(meal);
  }
}