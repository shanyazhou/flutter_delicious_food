import 'package:flutter/material.dart';
import 'package:theme2/core/model/category_model.dart';
import 'package:theme2/core/services/json_parse.dart';
import 'dart:ui';
import 'home_category_item.dart';

/// 方法一：使用StatefulWidget
// class YZHomeContent extends StatefulWidget {
//   const YZHomeContent({super.key});
//
//   @override
//   State<YZHomeContent> createState() => _YZHomeContentState();
// }
//
// class _YZHomeContentState extends State<YZHomeContent> {
//
//   List<YZCategoryModel> _categoryList = [];
//
//   @override
//   void initState(){
//     super.initState();
//     /// 加载数据
//     JsonParse.getCategoryData().then((result){
//       print(result);
//       setState(() {
//         _categoryList = result;
//       });
//     });
//
//   }
//
//   Widget build(BuildContext context) {
//     return Center(
//       child: GridView.builder(
//           padding: EdgeInsets.all(20),
//           itemCount: _categoryList.length ,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 1.5,
//           ),
//           itemBuilder: (ctx, index){
//             return YZHomeCategoryItem(categoryItem: _categoryList[index]);
//           }
//       ),
//     );
//   }
// }


// 方法二：使用StatelessWidget
class YZHomeContent extends StatelessWidget {
  const YZHomeContent({super.key});

  Widget build(BuildContext context) {
    return FutureBuilder<List<YZCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot){

        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) { return Center(child: Text("请求失败")); }

        final categoryList = snapshot.data;
        return Center(
          child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: categoryList!.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (ctx, index){
                return YZHomeCategoryItem(categoryItem: categoryList[index]);
              }
          ),
        );
      },
    );
  }
}

// class _YZHomeContentState extends State<YZHomeContent> {
//
//   // List<YZCategoryModel> _categoryList = [];
//   //
//   // @override
//   // void initState(){
//   //   super.initState();
//   //   /// 加载数据
//   //   JsonParse.getCategoryData().then((result){
//   //     print(result);
//   //     setState(() {
//   //       _categoryList = result;
//   //     });
//   //   });
//   //
//   // }
//
//  
// }
