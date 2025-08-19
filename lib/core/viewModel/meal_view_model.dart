import 'package:flutter/cupertino.dart';
import 'package:theme2/core/model/meal_model.dart';
import 'package:theme2/core/viewModel/filter_view_model.dart';
import '../services/meal_request.dart';

class YZMealViewModel extends ChangeNotifier{
  List<Meal> _meals = [];
  YZFilterViewModel? _filterVM;

  // 创建一个meals的get方法，这样私有变量可以通过get方法去访问，而不能修改
  List<Meal> get meals {
    // return _meals;
    return _meals.where((meal) {
      // 过滤
      if (_filterVM!.isGlutenFree && !meal.isGlutenFree) {// 自己选择true，
        return false;
      }

      if (_filterVM!.isLactoseFree && !meal.isLactoseFree) {// 自己选择true，
        return false;
      }

      if (_filterVM!.isVegan && !meal.isVegan) {// 自己选择true，
        return false;
      }

      if (_filterVM!.isVegetarian && !meal.isVegetarian) {// 自己选择true，
        return false;
      }

      return true;
    }).toList();
  }

  void updateFilterVM(YZFilterViewModel filterVM){
    _filterVM = filterVM;
  }

  YZMealViewModel() {
    YZMealRequest.getMealData().then((meals){
      _meals = meals;
      notifyListeners();
    });
  }
}