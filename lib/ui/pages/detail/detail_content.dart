import 'package:flutter/material.dart';
import 'package:theme2/core/model/meal_model.dart';

class YZDetailContent extends StatelessWidget {

  final Meal meal;

  const YZDetailContent({
    super.key,
    required this.meal
  });

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView 可滚动
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle("制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle("制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  // 1. 横幅图片
  Widget buildBannerImage() {
    return Image.network(meal.imageUrl);
  }

  // 2. 制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      //height: meal.ingredients.length * 50,
      child: ListView.builder(
        // 禁止滚动
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        shrinkWrap: true,// false: 尽量占用最多高度。true：按实际高度占用
        itemCount: meal.ingredients.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            // height是比例值
            child: Padding(
              padding: EdgeInsets.only(left: 8),// 字体不要挨着左边太近
              child: Text(meal.ingredients[index],style: TextStyle(height: 2.5),),
            ),
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
          );
        },
      )
    );
  }


  //3. 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      width: MediaQuery.of(context).size.width - 20,
      padding: EdgeInsets.all(0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),// 不写的话，下面会留有空白
        itemCount: meal.steps.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    // 方法一：
                    // ClipRRect(
                    //   borderRadius: BorderRadius.all(Radius.circular(15)),
                    //   child: Container(
                    //     color: Colors.orangeAccent,
                    //     width: 30,
                    //     height: 30,
                    //     child: Center(child: Text("#${index + 1}", style: TextStyle(color: Colors.white, ),)),
                    //   ),
                    // ),

                    // 方法二：
                    CircleAvatar(
                      child: Text("#${index + 1}", style: TextStyle(color: Colors.white, )),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Text(meal.steps[index],)),
                  ],
                ),

                // 仅在不是最后一个步骤时显示分割线
                if (index != meal.steps.length - 1)
                  Container(
                    margin: EdgeInsets.only(top: 15), // 分割线与文字的间距
                    color: Colors.grey.withOpacity(0.5),
                    height: 1,
                  )
              ],
            ),
          );
        })
    );
  }

  //标题
  Widget buildMakeTitle(String title) {
    return Container(
        //padding: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(vertical: 5),//symmetric 对称的
        child: Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)
    );
  }
}
