import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:theme2/core/model/meal_model.dart';
import 'http_request.dart';

// 使用本地数据
class YZMealRequest {
  static Future<List<Meal>> getMealData() async {
    try {
      // 1. 读取本地assets文件
      final String jsonString = await rootBundle.loadString('assets/json/meal.json');
      
      // 2. 解析JSON
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      
      // 3. 获取meal数组
      final List<dynamic> mealList = jsonData["meal"];
      
      // 4. 转换为Meal对象列表
      List<Meal> meals = [];
      for (var mealJson in mealList) {
        meals.add(Meal.fromJson(mealJson));
      }
      
      return meals;
    } catch (e) {
      print("解析meal.json失败: $e");
      return [];
    }
  }
}

// 使用网络数据
// class YZMealRequest {
//   static Future<List<YZMealModel>> getMealData() async{
//     // 1. 发送网络请求
//     final url = "down/DDIyi0X04l4o.json";
//     //异步请求，所以加上await
//     final result = await HttpRequest.request(url);
//
//     // 2. json转model
//     final meal = result["meal"];
//
//     List<YZMealModel> mealList = [];
//     for (var json in meal) {
//       mealList.add(YZMealModel.fromJson(json));
//     }
//     return mealList;
//   }
// }
