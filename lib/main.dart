import 'package:flutter/material.dart';

//关于文本  Text
//void main() {
//  runApp(MyApp());
//  runApp(new MaterialApp(home: new TextDemo()));

//  runApp(new MaterialApp(home: new TextDemoJianShu()));//文字 Text
//  runApp(new MaterialApp(home: new MyApp())); //输入框  TextField
//  runApp(new MaterialApp(home: new ImageDemo())); //图片 Image

//  runApp(new MaterialApp(home: new LayoutDemo())); //Row、Column
//  runApp(new MaterialApp(home: new StackLayoutDemo()));//Stack 层叠布局
//  runApp(new MaterialApp(home: new CenterLayoutDemo()));//Center既中心定位控件
//  runApp(new MaterialApp(home: new ListViewLayoutDemo()));//ListView
//  runApp(new MaterialApp(home: new AlignLayoutDemo()));//Align 对齐控件
//runApp(new MaterialApp(home: new SizedBoxLayoutDemo()));//SizedBox能够强制控制子控件的宽高显示
//runApp( new  MaterialApp(home:new OpacityLayoutDemo()));//Opacity控件能调整子控件的不透明度，使子控件部分透明

//runApp(new MaterialApp(home:new MyAppGes()));//GestureDetector在Flutter中负责处理跟用户的简单手势交互

//  runApp(new MaterialApp(home:new ButtonPage()));//Button
//
//}
void main() => runApp(MyGrid());

//region 电影海报案例
class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '电影海报',
        home: Scaffold(
            appBar: AppBar(
                title: Text('实例'),
                centerTitle: true),
            body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.0, //每行间距 padding
                crossAxisSpacing: 2.0, //每列间距 竖向margin
                childAspectRatio: 0.75,
              ),
              children: <Widget>[
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
                new Image.network(
                    "https://img.mukewang.com/5ea65155099c258403480172.jpg",
                    fit: BoxFit.cover),
              ],
            )));
  }
}
//endregion

//===========================================
//region Flutter中容器：
//Row、Column
//Stack
//Center
//Container
//ListView
//Align
//Padding
//SizedBox
//AspectRadio
//DecoratedBox
//Opactity

//endregion
//region Row、Column
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("水平方向布局"),
      ),

      //布局方向  Row:水平布局 Column：垂直布局
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮');
            },
            color: const Color(0xffff0000),
            child: new Text('红色按钮'),
          ),
          new RaisedButton(
            onPressed: () {
              print("点击蓝色按钮");
            },
            color: const Color(0xff000099),
            child: new Text('蓝色按钮'),
          ),
          new RaisedButton(
            onPressed: () {
              print("点击粉色按钮");
            },
            color: const Color(0xffee9999),
            child: new Text('粉色按钮'),
          )
        ],
      ),
    );
    ;
  }
}

//endregion
//region Stack 层叠布局
class StackLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('层叠布局'),
        ),
        body: new Center(
          child: new Stack(
            children: <Widget>[
              new Image.network(
                'https://avatar.csdn.net/6/0/6/1_xieluoxixi.jpg',
                scale: 0.5,
              ),
              new Positioned(
                  left: 35.0,
                  right: 35.0,
                  top: 45.0,
                  child: new Text(
                    '第二层内容区域',
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'serif',
                    ),
                  )),
              new Positioned(
                  left: 55.0,
                  right: 55.0,
                  top: 55.0,
                  child: new Text(
                    '第三层 this is the third child',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                      fontFamily: 'serif',
                    ),
                  ))
            ],
          ),
        ));
  }
}

//endregion
//region Center既中心定位控件，能够将子控件放在其内部中心。
class CenterLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('中心布局'),
      ),
      body: new Center(
        child: new Text('我在屏幕中央'),
      ),
    );
  }
}

//endregion
//region listview 长列表数据
class ListViewLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动布局'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new Text(
              '\n大标题',
              style: new TextStyle(fontFamily: 'serif', fontSize: 20.0),
            ),
          ),
          new Center(
            child: new Text(
              '小标题',
              style: new TextStyle(
                fontFamily: 'serif',
                fontSize: 12.0,
              ),
            ),
          ),
          new Center(
            child: new Text(
              '''
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
             内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是 
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是 
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
             内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
             内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
             内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
            内容sadf手动阀防守打法 发生富士达发生发生飞都是
           
                             ''',
              style: new TextStyle(fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}

//endregion 长列表数据
//region Align即对齐控件，能将子控件按照所指定的方式对齐，并根据子控件的大小调整自己的大小。Align对齐子控件的方式有如下几种
//bottomCenter    (0.5, 1.0)    底部中心
//bottomLeft    (0.0, 1.0)    左下角
//bottomRight    (1.0, 1.0)    右下角
//center    (0.5, 0.5)    水平垂直居中
//centerLeft    (0.0, 0.5)    左边缘中心
//centerRight    (1.0, 0.5)    右边缘中心
//topCenter    (0.5, 0.0)    顶部中心
//topLeft    (0.0, 0.0)    左上角
//topRight    (1.0, 0.0)    右上角
class AlignLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Align布局'),
      ),
      body: new Stack(
        children: <Widget>[
          new Align(
            alignment: new FractionalOffset(0.0, 0.5),
            child: new Text(
              '我在左边缘中心',
              style: new TextStyle(fontSize: 35.0),
            ),
          ),
          new Align(
            alignment: new FractionalOffset(1.0, 1.0),
            child: new Text(
              '我在右下角',
              style: new TextStyle(fontSize: 30.0),
            ),
          )
        ],
      ),
    );
  }
}

//endregion
//region SizedBox能够强制控制子控件的宽高显示
class SizedBoxLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SizedBox布局'),
      ),
      body: new SizedBox(
        width: 200.0,
        height: 200.0,
        child: new Container(
          decoration: new BoxDecoration(color: Colors.red),
        ),
      ),
    );
  }
}

//endregion
//region Opacity控件能调整子控件的不透明度，使子控件部分透明，不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
class OpacityLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Opacity'),
      ),
      body: new Center(
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new Text("我在透明区域下方"),
            new Opacity(
              opacity: 0.5,
              child: new Container(
                width: 200.0,
                height: 220.0,
                decoration: new BoxDecoration(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//endregion

//region GestureDetector在Flutter中负责处理跟用户的简单手势交互，GestureDetector控件没有图像展示，只是检测用户输入的手势，并作出相应的处理，包括点击、拖动和缩放。
class MyAppGes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Gestures"),
      ),
      body: new Center(
          child: new GestureDetector(
        child: new Text(
          "我被赋予了点击触摸能力...",
          style: new TextStyle(fontSize: 20.0),
        ),
        onTap: () {
          print("------onTap");
        },
        onDoubleTap: () {
          print("------onDoubleTap");
        },
        onLongPress: () {
          print("-----onLongPress");
        },
        onVerticalDragStart: (details) {
          print("在垂直方向开始位置:" + details.globalPosition.toString());
        },
        onVerticalDragEnd: (details) {
          print("在垂直方向结束位置:" + details.primaryVelocity.toString());
        },
      )),
    );
  }
}
//endregion
//RaisedButton、FlatButton、OutlineButton、MaterialButton、还有RawMaterialButton、FloationgActionButton
//button
//region 第一类OutlineButton 默认带有一个边框，我们可以通过属性指定正常状态，跟用户点击状态下的边框颜色。
//const OutlineButton({//构造方法说明
//    Key key,
//    @required VoidCallback onPressed,
//    ButtonTextTheme textTheme,  //按钮上字体主题
//    Color textColor,  //字体颜色
//    Color disabledTextColor, //按钮禁用时候文字的颜色
//    Color color,  //按钮背景颜色
//    Color highlightColor,//点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
//    Color splashColor, //水波纹的颜色
//    double highlightElevation,//高亮时候的阴影
//    this.borderSide,//按钮边框
//    this.disabledBorderColor, //按钮禁用时边框的颜色
//    this.highlightedBorderColor,//高亮时边框的颜色
//    EdgeInsetsGeometry padding,//边距
//    ShapeBorder shape, //设置shape
//    Clip clipBehavior = Clip.none,
//    Widget child,
//  })

//设置边框样式
/*new OutlineButton(
textColor: Colors.blue,
highlightedBorderColor: Colors.deepOrange,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
borderSide: new BorderSide(color: Colors.blueAccent),
onPressed: () {},
child: new Text("OutlineButton")
),*/
//endregion
// region 第二类 FloatingActionButton做过原生安卓开发的读者应该很熟悉这个名字，在Flutter中不光引用了原生安卓的叫法，使用方法也大同小异。
//const FloatingActionButton({
//    Key key,
//    this.child,
//    this.tooltip,
//    this.foregroundColor,
//    this.backgroundColor,
//    this.heroTag = const _DefaultHeroTag(),
//    this.elevation = 6.0,
//    this.highlightElevation = 12.0,
//    @required this.onPressed,
//    this.mini = false,
//    this.shape = const CircleBorder(),
//    this.clipBehavior = Clip.none,
//    this.materialTapTargetSize,
//    this.isExtended = false,
//  })构造方法

//endregion
// region 第三类 RaisedButton、FlatButton、OutlineButton、MaterialButton
//new RaisedButton(//构造方法
//            color: Colors.blueAccent,
//            //按钮的背景颜色
//            padding: EdgeInsets.all(15.0),
//            //按钮距离里面内容的内边距
//            textColor: Colors.white,
//            //文字的颜色
//            textTheme: ButtonTextTheme.normal,
//            //按钮的主题
//            onHighlightChanged: (bool b) {
//              //水波纹高亮变化回调
//            },
//            disabledTextColor: Colors.black54,
//            //按钮禁用时候文字的颜色
//            disabledColor: Colors.black54,
//            //按钮被禁用的时候显示的颜色
//            highlightColor: Colors.green,
//            //点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
//            splashColor: Colors.amberAccent,
//            //水波纹的颜色
//            colorBrightness: Brightness.light,
//            //按钮主题高亮
//            elevation: 10.0,
//            //按钮下面的阴影
//            highlightElevation: 10.0,
//            //高亮时候的阴影
//            disabledElevation: 10.0,
//            //按下的时候的阴影
//            shape: new RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(20.0)),
//            //设置形状
//            onPressed: () {},
//            child: new Text("RaisedButton"),
//          ),

//endregion
// region 所有整合
class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Button Widget"),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {}, child: new Icon(Icons.adb), tooltip: "点击"),
      body: new ListView(
        children: <Widget>[
          new Text("简单样式",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.brown, fontSize: 20.0)),
          new RaisedButton(onPressed: () {}, child: new Text("RaisedButton")),
          new FlatButton(onPressed: () {}, child: new Text("FlatButton")),
          new MaterialButton(
              onPressed: () {}, child: new Text("MaterialButton")),
          new RawMaterialButton(
              onPressed: () {}, child: new Text("RawMaterialButton")),
          new OutlineButton(onPressed: () {}, child: new Text("OutlineButton")),
          new SizedBox(height: 20),
          new Text("升级样式",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.brown, fontSize: 20.0)),
          new RaisedButton(
            color: Colors.blueAccent,
            //按钮的背景颜色
            padding: EdgeInsets.all(15.0),
            //按钮距离里面内容的内边距
            textColor: Colors.white,
            //文字的颜色
            textTheme: ButtonTextTheme.normal,
            //按钮的主题
            onHighlightChanged: (bool b) {
              //水波纹高亮变化回调
            },
            disabledTextColor: Colors.black54,
            //按钮禁用时候文字的颜色
            disabledColor: Colors.black54,
            //按钮被禁用的时候显示的颜色
            highlightColor: Colors.green,
            //点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
            splashColor: Colors.amberAccent,
            //水波纹的颜色
            colorBrightness: Brightness.light,
            //按钮主题高亮
            elevation: 10.0,
            //按钮下面的阴影
            highlightElevation: 10.0,
            //高亮时候的阴影
            disabledElevation: 10.0,
            //按下的时候的阴影
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //设置形状
            onPressed: () {},
            child: new Text("RaisedButton"),
          ),
          new FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.red,
              onPressed: () {},
              child: new Text("FlatButton")),
          new OutlineButton(
              textColor: Colors.blue,
              highlightedBorderColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              borderSide: new BorderSide(color: Colors.blueAccent),
              onPressed: () {},
              child: new Text("OutlineButton")),
          MaterialButton(
              color: Colors.yellow,
              textColor: Colors.red,
              onPressed: () {},
              child: new Text("MaterialButton")),
          RawMaterialButton(
              fillColor: Colors.deepOrange,
              onPressed: () {},
              child: new Text(
                "RawMaterialButton",
                style: new TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
//endregion

//===========================================
//region 图片 Image

//Image.network(String src, {
//Key key,
//    double scale: 1.0,//缩小倍数
//this.width,//宽
//this.height,//高
//this.color,
//this.colorBlendMode,
//this.fit, //填充方式
//this.alignment: Alignment.center,
//this.repeat: ImageRepeat.noRepeat, //图片排列方式
//this.centerSlice,
//this.matchTextDirection: false,
//this.gaplessPlayback: false,
//Map<String, String> headers,
//})

//new Image, 用于从ImageProvider获取图像。
//new Image.asset, 用于从AssetBundle获取图像。
//new Image.network, 用于从URL获取图像。
//new Image.file, 用于从文件中获取图像。
//new Image.memory, 用于从内存中获取图像
//在flutter中Image支持JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, 和 WBMP这几种图片格式。
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new TextField(
            decoration: new InputDecoration(),
          ),
        ),
//        body: new Image.network("https://p1.ssl.qhmsg.com/dr/220__/t01d5ccfbf9d4500c75.jpg",width:500,height: 500,)//获取网络图片
        body: new Image.asset(
          'image/ic_launcher.png',
          width: 500,
          height: 500,
        ) //获取本地图片
        );
  }
}

//endregion
//region 输入框 TextField
//const InputDecoration({
//this.icon, //输入框左侧添加个图标
//this.labelText,//输入框获取焦点/有内容 会移动到左上角，否则在输入框内labelTex的位置
//this.labelStyle,
//this.helperText,
//this.helperStyle,
//this.hintText, //未输入文字时，输入框中的提示文字
//this.hintStyle,
//this.errorText,
//this.errorStyle,
//this.errorMaxLines,
//this.isDense,
//this.contentPadding,
//this.prefixIcon, //输入框内侧左面的控件
//this.prefix,
//this.prefixText,
//this.prefixStyle,
//this.suffixIcon,//输入框内侧右面的图标
//this.suffix,
//this.suffixText,
//this.suffixStyle,
//this.counterText,
//this.counterStyle,
//this.filled,
//this.fillColor,
//this.errorBorder,
//this.focusedBorder,
//this.focusedErrorBorder,
//this.disabledBorder,
//this.enabledBorder,
//this.border,  //增加一个边框
//this.enabled = true,
//this.semanticCounterText,
//})
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _userPhoneController = new TextEditingController();
    TextEditingController _userPasswordController = new TextEditingController();
    void onTextClear() {
      setState(() {
        // 清空输入框内容
        _userPhoneController.text = "";
        _userPasswordController.text = "";
      });
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("登录"),
        ),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: _userPhoneController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  icon: new Icon(Icons.phone),
                  labelText: "请输入手机号",
                  helperText: "注册时填写的手机号"),
              onChanged: (String str) {
                //onChanged是每次输入框内每次文字变更触发的回调
                print('手机号为：$str----------');
              },
              onSubmitted: (String str) {
                //onSubmitted是用户提交而触发的回调{当用户点击提交按钮（输入法回车键）}
                print('最终手机号为:$str---------------');
              },
            ),
            new TextField(
              controller: _userPasswordController,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  icon: new Icon(Icons.nature_people),
                  labelText: "请输入名字",
//                  hintText: "fdsfdss",
                  helperText: "注册名字"),
            ),
            new Builder(builder: (BuildContext context) {
              return new RaisedButton(
                onPressed: () {
                  if (_userPasswordController.text.toString() == "10086" &&
                      _userPhoneController.text.toString() == "10086") {
                    Scaffold.of(context)
                        .showSnackBar(new SnackBar(content: new Text("校验通过")));
                  } else {
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("校验有问题，请重新输入")));
                    onTextClear(); //情况输入内容，让用户重新输入
                  }
                },
                color: Colors.blue,
                highlightColor: Colors.deepPurple,
                disabledColor: Colors.cyan,
                child: new Text(
                  "登录",
                  style: new TextStyle(color: Colors.white),
                ),
              );
            })
          ],
        ));
  }
}

//endregion
//region Text 文本内容 斜体下划线粗体等
//const Text(this.data, {  //Text显示的内容
//Key key,
//this.style, //Text显示的样式
//this.textAlign,//文本应该如何水平对齐,TextAlign.start,end 或者center
//this.textDirection, //文本方向,TextDirection.ltr\TextDirection.rtl
//this.locale,
//this.softWrap,  //是否自动换行，若为false，文字将不考虑容器大小，单行显示，超出屏幕部分将默认截断处理
//this.overflow, //当文字超出屏幕的时候，如何处理,TextOverflow.clip(裁剪)\TextOverflow.fade(渐隐)\TextOverflow.ellipsis(省略号)
//this.textScaleFactor, //字体显示倍率，上面的例子使用的字体大小是20.0，将字体设置成10.0，然后倍率为2
//this.maxLines, //最大行数设置
//this.semanticsLabel,
//})
class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello Flutter"),
      ),
      body: new Center(
        child: new Text(
          "This is Flutter Widget ---- Text ，is a StatelessWidget",
          style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TextDemoJianShu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hello Flutter"),
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                'inherit: 为 false 的时候不显示',
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.redAccent,
                  inherit: false,
                ),
              ),
              new Text(
                'color/fontSize: 字体颜色，字号等',
                style: new TextStyle(
                  color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 22.0,
                ),
              ),
              new Text(
                'fontWeight: 字重',
                style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w700),
              ),
              new Text(
                'fontStyle: FontStyle.italic 斜体',
                style: new TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              new Text(
                'letterSpacing: 字符间距',
                style: new TextStyle(
                  letterSpacing: 10.0,
                  // wordSpacing: 15.0
                ),
              ),
              new Text(
                'wordSpacing: 字或单词间距',
                style: new TextStyle(
                    // letterSpacing: 10.0,
                    wordSpacing: 15.0),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.alphabetic',
                style: new TextStyle(textBaseline: TextBaseline.alphabetic),
              ),
              new Text(
                'textBaseline:这一行的值为TextBaseline.ideographic',
                style: new TextStyle(textBaseline: TextBaseline.ideographic),
              ),
              new Text('height: 用在Text控件上的时候，会乘以fontSize做为行高,所以这个值不能设置过大',
                  style: new TextStyle(
                    height: 1.0,
                  )),
              new Text('decoration: TextDecoration.overline 上划线',
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.redAccent,
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.wavy)),
              new Text('decoration: TextDecoration.lineThrough 删除线',
                  style: new TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.dashed)),
              new Text('decoration: TextDecoration.underline 下划线',
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.redAccent,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted)),
            ],
          ),
        ));
  }
}
//endregion

//region 初始代码
class MyAppEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//endregion