import 'package:flutter/material.dart';
import 'favor_content.dart';

class YZFavorPage extends StatelessWidget {
  const YZFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: YZFavorContent(),
    );
  }
}
