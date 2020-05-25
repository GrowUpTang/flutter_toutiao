import 'package:flutter/material.dart';

class StaticNavigatorPageWithResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("静态路由带返回参数"),
      ),
      body: new Center(
        child: new OutlineButton(
          onPressed: () {
            Navigator.of(context).pop("shi上个页面传递过来的吗");
            //当我们需要给上一个页面回传数据的时候可直接借助pop传递
            // Navigator.of(context).pop("页面结束后返回的数据");，
            // 不需要传值的时候直接返回空对象
          },
          child: Text("点我返回上个页面结束后返回的数据"),
        ),
      ),
    );
  }
}