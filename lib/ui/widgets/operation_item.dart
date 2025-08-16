import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YZOperationItem extends StatelessWidget {

  final Widget icon;
  final String name;

  const YZOperationItem({
    super.key,
    required this.icon,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 3,),
        Text(name),
      ],
    );
  }
}
