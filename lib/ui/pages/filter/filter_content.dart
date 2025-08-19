import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme2/core/viewModel/filter_view_model.dart';

class YZFilterContent extends StatelessWidget {
  const YZFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          height: 60,
          alignment: Alignment.center,
          child: Text("展示你的选择", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
        ),

        Expanded(// 方法二：
          child: Consumer<YZFilterViewModel>(
            builder: (ctx, filterVM, child){
              return ListView(
                // 方法一：
                //shrinkWrap: true,

                children: [
                  buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value){
                    filterVM.isGlutenFree = value;
                  }),
                  buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value){
                    filterVM.isLactoseFree = value;
                  }),
                  buildListTile("普通素食者", "普通素食者", filterVM.isVegan, (value){
                    filterVM.isVegan = value;
                  }),
                  buildListTile("严格素食者", "严格素食者", filterVM.isVegetarian, (value){
                    filterVM.isVegetarian = value;
                  }),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, void Function(bool) onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
          value: value,
          onChanged: onChange,
      ),
    );
  }
}
