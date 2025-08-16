import 'package:flutter/cupertino.dart';
import 'package:theme2/core/model/meal_model.dart';
import '../services/meal_request.dart';

class YZMealViewModel extends ChangeNotifier{
  List<Meal> _meals = [];

  // 创建一个meals的get方法，这样私有变量可以通过get方法去访问，而不能修改
  List<Meal> get meals {
    return _meals;
  }

  YZMealViewModel() {
    YZMealRequest.getMealData().then((meals){
      _meals = meals;
      notifyListeners();
    });
  }
}