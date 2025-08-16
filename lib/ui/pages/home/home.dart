import 'package:flutter/material.dart';
import 'home_content.dart';

class YZHomePage extends StatelessWidget {
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: YZHomeContent()
    );
  }
}
