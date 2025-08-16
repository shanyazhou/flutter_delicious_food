import 'package:flutter/material.dart';
import 'package:theme2/core/model/category_model.dart';
import 'package:theme2/core/router/router.dart';
import 'meal_content.dart';

class YZMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  const YZMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context)?.settings.arguments as YZCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: Center(
        child: YZMealContent(),
      ),
    );
  }
}
