import 'package:flutter/material.dart';

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

        ListView(
          shrinkWrap: true,
          children: [
            Text("data"),
            Text("data"),
          ],
        )
      ],
    );
  }
}
