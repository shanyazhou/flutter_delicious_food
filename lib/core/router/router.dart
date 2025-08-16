import 'package:flutter/material.dart';
import 'package:theme2/ui/pages/main/main.dart';
import 'package:theme2/ui/pages/meal/meal.dart';


class YZRouter {
  // 初始的路由
  static final String initialRoute = YZMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    /// 两种不同的实现方法
    YZMainScreen.routeName: (ctx) {
      return YZMainScreen();
    },

    YZMealScreen.routeName: (ctx) => YZMealScreen(),
  };

  static final RouteFactory generateRoute = (setting) {
    return null;
  };

  static final RouteFactory unknownRoute = (setting) {
    return null;
  };
}