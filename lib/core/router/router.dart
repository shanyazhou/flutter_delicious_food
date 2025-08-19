import 'package:flutter/material.dart';
import 'package:theme2/ui/pages/detail/detail.dart';
import 'package:theme2/ui/pages/filter/filter.dart';
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
    YZDetailScreen.routeName: (ctx) => YZDetailScreen(),
  };

  /// 自己扩展
  static final RouteFactory generateRoute = (setting) {
    if (setting.name == YZFilterScreen.routeName){// 从下往上弹
       return MaterialPageRoute(
         builder:(context) {
          return YZFilterScreen();
         },
         fullscreenDialog: true// 从下往上弹窗
       );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (setting) {
    return null;
  };
}