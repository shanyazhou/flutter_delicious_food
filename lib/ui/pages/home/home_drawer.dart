import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:theme2/ui/pages/filter/filter.dart';

class YZHomeDrawer extends StatelessWidget {
  const YZHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 266,// 修改抽屉的宽度
        child: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.amber,
                alignment: Alignment(0, 0.5),
                margin: EdgeInsets.only(bottom: 20),
                child: Text("开始动手", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
              ),
              buildListTile(Icon(Icons.restaurant), "进餐", (){
                Navigator.of(context).pop();
              }),
              buildListTile(Icon(Icons.settings), "过滤", (){
                Navigator.of(context).pushNamed(YZFilterScreen.routeName);
              }),
            ],
          ),
        )
    );
  }

  Widget buildListTile(Widget icon, String name, void Function() handler) {
    return ListTile(
      leading: icon,
      title: Text(name),
      onTap: handler,
    );


    // Row(
    //   children: [
    //     icon,
    //     Text(name),
    //   ]
    // );
  }
}
