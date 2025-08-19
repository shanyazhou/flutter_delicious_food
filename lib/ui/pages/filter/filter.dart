import 'package:flutter/material.dart';

import 'filter_content.dart';

class YZFilterScreen extends StatelessWidget {

  static const String routeName = "/filter";

  const YZFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食过滤"),
      ),
      body: YZFilterContent(),
    );
  }
}
