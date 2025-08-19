import 'package:flutter/material.dart';
import 'home_content.dart';

class YZHomePage extends StatelessWidget {
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
        leading: IconButton(
          icon: Icon(Icons.build),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        //leading: Icon(Icons.add_a_photo_outlined), //加了这个，下面的Drawer()不管用了
      ),
      body: YZHomeContent(),
    );
  }
}
