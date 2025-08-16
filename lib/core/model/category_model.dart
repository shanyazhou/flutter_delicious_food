import 'dart:ui';

class YZCategoryModel {
  String? id;
  String? title;
  String? color;
  Color? bgColor;

  YZCategoryModel({this.id, this.title, this.color});

  YZCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 调用工具方法转换颜色
    bgColor = _hexToColor(json['color']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }

  // 工具方法：十六进制字符串转 Color
  Color? _hexToColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return null;
    // 移除可能的 # 前缀
    final String formattedHex = hexColor.startsWith('#')
        ? hexColor.substring(1)
        : hexColor;
    // 解析十六进制为 Color
    return Color(int.parse('0xFF$formattedHex'));
  }
}