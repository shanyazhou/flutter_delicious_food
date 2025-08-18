import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:theme2/core/router/router.dart";
import "package:theme2/core/services/meal_request.dart";
import "package:theme2/core/viewModel/meal_view_model.dart";
import "package:theme2/ui/pages/main/main.dart";

void main(){
  // 初始化Flutter绑定系统
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return YZMealViewModel();
      },
      child: MyApp() ,
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "美食广场",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        /// 设置背景颜色
        canvasColor: Color.fromARGB(255, 254, 222, 200),
        primaryColor: Color.fromARGB(255, 254, 222, 200),
        /// 设置核心背景色设置
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 254, 214),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.redAccent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            foregroundColor: Colors.white
        ),

      ),
      // home: YZMainScreen(),
      /// 以下为路由配置
      initialRoute: YZRouter.initialRoute,
      routes: YZRouter.routes,
      onGenerateRoute: YZRouter.generateRoute,
      onUnknownRoute: YZRouter.unknownRoute,

    );
  }
}
