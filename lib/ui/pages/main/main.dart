import 'package:flutter/material.dart';
import 'package:theme2/ui/pages/favor/favor.dart';
import 'package:theme2/ui/pages/home/home.dart';

class YZMainScreen extends StatefulWidget {
  //  首页默认路由可以设置为/
  static const String routeName = "/";

  const YZMainScreen({super.key});

  @override
  State<YZMainScreen> createState() => _YZMainScreenState();
}

class _YZMainScreenState extends State<YZMainScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          YZHomePage(),
          YZFavorPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // 保证字体不随着切换而变化
        selectedFontSize: 14,
        unselectedFontSize: 14,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "收藏",
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
