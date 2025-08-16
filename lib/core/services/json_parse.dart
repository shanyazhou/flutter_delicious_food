

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:theme2/core/model/category_model.dart';

class JsonParse {
  static Future<List<YZCategoryModel>> getCategoryData() async{
    //1. 加载JSON文件
    final jsonString = await rootBundle.loadString("assets/json/home.json");

    //2. 将jsonString转换成Map或者List
    final result = json.decode(jsonString);

    //将其他格式转换成jsonString
    // json.encoder()

    //3. 将Map中的内容转成一个个对象
    final resultList = result["category"];//获取到的是数组

    List<YZCategoryModel> categoryList = [];
    for (var json in resultList){
      categoryList.add(YZCategoryModel.fromJson(json));
    }

    return categoryList;
  }
}