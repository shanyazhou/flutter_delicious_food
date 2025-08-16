import 'package:flutter/material.dart';

class YZFavorPage extends StatelessWidget {
  const YZFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: Center(
        child: Text("这里是收藏"),
      ),
    );
  }
}
