import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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

//这是入口，运行这个方法 走出刚才给你的截图 就是电影 那个列表模板
//void main() => runApp(MyAppEdit());
void main() {

  runApp(new MaterialApp(
    home: new StoragePage_Path(),
  ));
}

//region SharedPreferences 数据存储
class StoragePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StorageState();
}

class StorageState extends State {
  var _textFieldController = new TextEditingController();
  var _storageString = '';
  final STORAGE_KEY = 'storage_key';

//   * 利用SharedPreferences存储数据
  Future saveString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        STORAGE_KEY, _textFieldController.value.text.toString());
  }

//   * 获取存在SharedPreferences中的数据
  Future getString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _storageString = sharedPreferences.get(STORAGE_KEY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数据存储'),
      ),
      body: new Column(
        children: <Widget>[
          Text("shared_preferences存储", textAlign: TextAlign.center),
          TextField(
            controller: _textFieldController,
          ),
          MaterialButton(
            onPressed: saveString,
            child: new Text("存储"),
            color: Colors.pink,
          ),
          MaterialButton(
            onPressed: getString,
            child: new Text("获取"),
            color: Colors.lightGreen,
          ),
          Text('shared_preferences存储的值为  $_storageString'),
        ],
      ),
    );
  }
}

//endregion
//region 文件存储

//path_provider中有三个获取文件路径的方法：

//getTemporaryDirectory()//获取应用缓存目录，等同IOS的NSTemporaryDirectory()和Android的getCacheDir() 方法
//getApplicationDocumentsDirectory()获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
//getExternalStorageDirectory()//这个是存储卡，仅仅在Android平台可以使用

class StoragePage_Path extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StorageState_Path();
}

class StorageState_Path extends State {
  var _textFieldController = new TextEditingController();
  var _storageString = '';

  /**
   * 利用文件存储数据
   */
  saveString() async {
    final file = await getFile('file.text');
    //写入字符串
    file.writeAsString(_textFieldController.value.text.toString());
  }

  /**
   * 获取存在文件中的数据
   */
  Future getString() async {
    final file = await getFile('file.text');
    var filePath  = file.path;
    setState(() {
      file.readAsString().then((String value) {
        _storageString = value +'\n文件存储路径：'+filePath;
      });
    });
  }

  /**
   * 初始化文件路径
   */
  Future<File> getFile(String fileName) async {
    //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
    final fileDirectory = await getApplicationDocumentsDirectory();

    //获取存储路径
    final filePath = fileDirectory.path;

    //或者file对象（操作文件记得导入import 'dart:io'）
    return new File(filePath + "/"+fileName);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('数据存储'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("文件存储", textAlign: TextAlign.center),
          TextField(
            controller: _textFieldController,
          ),
          MaterialButton(
            onPressed: saveString,
            child: new Text("存储"),
            color: Colors.cyan,
          ),
          MaterialButton(
            onPressed: getString,
            child: new Text("获取"),
            color: Colors.deepOrange,
          ),
          Text('从文件存储中获取的值为  $_storageString'),
        ],
      ),
    );
  }
}
//endregion path_provider




//轻量级的 提示widget
// region Tooltip 长按widget时，会在上方或者下方出现类似Toast的提示，隔一段时间自动消失
//Tooltip支持用户传入任意一个child作为显示的Widget，
// 并且在用户长按Widget时，会在上方或者下方出现类似Toast的提示，隔一段时间自动消失，由于使用起来比较简单
class MyTooltip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooltips"),
      ),
      body: Center(
        child: Tooltip(
            message: "显示提示内容",
            //提示的内容
            height: 60.0,
            //Tooltip的高度
            verticalOffset: 50.0,
            //具体内部child Widget竖直方向的距离,
            preferBelow: false,
            //是否显示在下面
            padding: EdgeInsets.all(20.0),
            //padding
            child: Icon(
              Icons.android,
              size: 50.0,
              color: Colors.green,
            )),
      ),
    );
  }
}
//endregion
//region SnackBar 需要在外城包括上Builder Widget，这个Builder不做任何的其他操作，只不过把Widget树往下移了一层而已。
//SnackBar无论是用法还是功能使用几乎都跟原生Android一样 ，
// 唯一有一点需要留意的是在Scaffold.of(context).showSnackBar()中传递的context必须不能是Scaffold下面的Context

//const SnackBar({
//Key key,
//@required this.content,//内容
//this.backgroundColor,//背景
//this.action,//其他操作
//this.duration: _kSnackBarDisplayDuration,//显示时长
//this.animation,//进出动画
//})

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SnackBar"),
      ),
      body: new Center(
        child: new Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              //值得注意的是这个context必须不能是Scaffold节点下的context,因为Scaffold.of（）
              // 方法需要从Widget树中去找到Scaffold的Context，所以如果直接在Scaffold中使用showSnackBar，
              // 需要在外城包括上Builder Widget，这个Builder不做任何的其他操作，只不过把Widget树往下移了一层而已。
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("确定删除吗 "),
                action: new SnackBarAction(
                    label: "撤销",
                    onPressed: () {
                      print("点击撤回---------------");
                    }),
              ));
            },
            child: new Text("SnackBar widget"),
            color: Colors.cyan,
            highlightColor: Colors.lightBlueAccent,
            disabledColor: Colors.lightBlueAccent,
          );
        }),
      ),
    );
  }
}
//endregion


//非轻量级的提示组件
//region SimpleDialog就是一个简单的对话框，开发者只需传入title跟child就可以使用它，
// 其中child是一个Widget数组，用户可以根据业务需求传入任意的Widget，然后借助showDialog唤起即可。
class MyAppSimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SimpleDialog"),
      ),
      body: new Center(
        child:  new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: new SimpleDialog(
                    title: new Text("标题"),
                    contentPadding: const EdgeInsets.all(10.0),
                    children: <Widget>[    //SimpleDialog内可指定多个children
                      new Text("文字内容1"),
                      new ListTile(
                        leading: new Icon(Icons.android),
                        title: new Text("android"),
                      ),

                      new Text("文字内容2"),
                      new Text("文字内容3"),
                      new Text("文字内容4"),
                    ],
                  ));
            },
            child: new Text("Dialog出来"),
            color: Colors.blue,
            highlightColor: Colors.lightBlueAccent,
            disabledColor: Colors.lightBlueAccent),

      ),
    );
  }
}
//endregion
//region AlertDialog 在SimpleDialog的基础上新增了action操作而已，
//AlertDialog其实就是simpleDialog的封装，更加方便开发者使用，只不过在SimpleDialog的基础上新增了action操作而已，
//用户可以定制具体类似，“取消”、“确定”等一切可能存在dialog上的逻辑处理。
class MyAppAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AlertDialog"),
      ),
      body: new Center(
        child: new Builder(builder: (BuildContext context) {
          return new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text("温馨提示"),
                    content: new Text("您确定输入正确吗？"),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context);
                          },
                          child: new Text("确定")),
                      new FlatButton(
                          onPressed: () {
                            print("点击取消------");
                          },
                          child: new Text("取消")),
                    ],
                  ));
            },
            color: Colors.lightBlueAccent,
            child: new Icon(Icons.phone),
          );
        }),
      ),
    );
  }
}

//endregion
//region BottomSheetDialog、ModalBottomSheetDialog
// 同样也是需要借助showDialog唤起，就跟它名字一样，这两种dialog是从屏幕下方向上弹出的，
// 不同的是BottomSheetDialog默认会铺满全屏显示，而ModalBottomSheetDialog半屏显示，二者都支持随用户手指拖动上下移动。

//1.showBottomSheet(context,child) 上下文参数，Widget数组
//2.showModalBottomSheet(context,child) 上下文参数，Widget数组
class MyAppBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BottomSheet"),
      ),
      body: new Column(
        children: <Widget>[
          new Builder(builder: (BuildContext context){
            return new RaisedButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return new Container(
                        child: new Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Column(
                            children: <Widget>[
                              new ListTile(
                                leading: new Icon(Icons.chat),
                                title: new Text("对话框列表1"),
                              ),
                              new ListTile(
                                leading: new Icon(Icons.help),
                                title: new Text("对话框列表2"),
                              ),
                              new ListTile(
                                leading: new Icon(Icons.settings),
                                title: new Text("对话框列表3"),
                              ),
                              new ListTile(
                                leading: new Icon(Icons.more),
                                title: new Text("对话框列表4"),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: new Text("BottomSheet"),
            );
          }),


          //showModalBottomSheet与BottomSheet的区别是 BottomSheet充满屏幕，ModalBottomSheet半屏
          new RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                      child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.chat),
                              title: new Text("对话框列表1"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.help),
                              title: new Text("对话框列表2"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.settings),
                              title: new Text("对话框列表3"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.more),
                              title: new Text("对话框列表4"),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: new Text("ModalBottomSheet"),
          ),
        ],
      ),
    );
  }
}
//endregion

//进度条
//region CircularProgressIndicator圆环进度条

//const CircularProgressIndicator({
//Key key,
//double value,  //进度（0-1）之间，不设置进度会一直循环
//Color backgroundColor,
//Animation<Color> valueColor, //圆环进度颜色
//this.strokeWidth = 4.0, //圆环进度条宽度
//String semanticsLabel,
//String semanticsValue,
//})//构造方法

class MyCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Text("设置进度比为80%(0.8)"),
              SizedBox(height: 30.0),
              CircularProgressIndicator(
                value: 0.8, //
                backgroundColor: Colors.green,
                strokeWidth: 10.0,
              ),
              SizedBox(height: 30.0), //设置间隔
              Text("未做任何处理，默认一直循环"),
              CircularProgressIndicator(),

              Text("设置圆环进度颜色为红色"),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              ),
            ],
          )),
    );
  }
}
//endregion
//region LinearProgressIndicator水平进度条
//const LinearProgressIndicator({
//    Key key,
//    double value,
//    Color backgroundColor,
//    Animation<Color> valueColor,
//    String semanticsLabel,
//    String semanticsValue,
//  })
class FlutterDemoLinearProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Text("设置进度比为80%(0.8)"),
              SizedBox(height: 30.0),
              LinearProgressIndicator(
                value: 0.8, //
                backgroundColor: Colors.green,
              ),
              SizedBox(height: 30.0), //设置间隔
              Text("未做任何处理，默认一直循环"),
              LinearProgressIndicator(),

              Text("设置进度颜色为红色,背景透明"),
              LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              ),
            ],
          )),
    );
  }
}
//endregion

//region Slider滑杆

//const Slider({
//Key key,
//@required this.value,//滑块的值
//@required this.onChanged, //改变时触发。
//this.onChangeStart, //改变前触发。
//this.onChangeEnd,  //改变后触发。
//this.min = 0.0, //用户可以选择的最小值。
//this.max = 1.0, //用户可以选择的最大值。
//this.divisions, //离散部分的数量
//this.label, //滑块处于活动状态时显示在滑块上方的标签。
//this.activeColor,//激活时的颜色
//this.inactiveColor,//滑块轨道的非活动部分的颜色。
//this.semanticFormatterCallback,
//})

//静态
class FlutterDemoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
        child: new Slider(
          value: 0.4,
          onChanged: null,
        ),
      ),
    );
  }
}
//动态

//构造方法
//const Slider({
//Key key,
//@required this.value,滑块的值
//@required this.onChanged, //改变时触发。
//this.onChangeStart, //改变前触发。
//this.onChangeEnd,  //改变后触发。
//this.min = 0.0, //用户可以选择的最小值。
//this.max = 1.0, //用户可以选择的最大值。
//this.divisions, //离散部分的数量
//this.label, //滑块处于活动状态时显示在滑块上方的标签。
//this.activeColor,//激活时的颜色
//this.inactiveColor,//滑块轨道的非活动部分的颜色。
//this.semanticFormatterCallback,
//})

class FlutterDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliderState();
}

class SliderState extends State {
  double _currentIndex = 0.0;
  void _onSliderStateChanged(double value) {
    setState(() {
      _currentIndex = value;
      print(_currentIndex.toString() + '-------------------');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
        child: new Slider(
          value: _currentIndex,
          label: '星期${(_currentIndex*10).floor().toString()}',
          activeColor: Colors.redAccent,
          inactiveColor: Colors.grey,
          max: 0.7,
          min: 0.0,
          onChanged: _onSliderStateChanged,
          onChangeStart: (value){
            print('开始滑动-------------$value');
          },
          onChangeEnd: (value){
            print('结束滑动-------------$value');
          },
          divisions: 7,
        ),
      ),
    );
  }
}
//endregion
//region Checkbox 选中
//Checkbox跟Slider一样，因为需要处理或者说需要记录用户的选择状态，
// 然后去更新Checkbox的选中状态，所以理所当然我们也需要使用StatefullWidget来完成这一操作
class FlutterDemoCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliderStateCheckBox();
}

class SliderStateCheckBox extends State {
  bool isChecked = false;

  void _onCheckStateChanged(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
        child: new Checkbox(
          value: isChecked,
          onChanged: _onCheckStateChanged,
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
//endregion
//region Switch
// 跟Checkbox用户上类似，都是为了记录用户的选中状态，
// 只不过是Switch可定制的部分比Checkbox更多一些，开发者可以加入更多的个性化定制

//const Switch({
//Key key,
//@required this.value,//切换按钮的值。
//@required this.onChanged,//改变时触发。
//this.activeColor, //激活时圆点的颜色。
//this.activeTrackColor, //激活时横条的颜色
//this.inactiveThumbColor,//非激活时原点的颜色。
//this.inactiveTrackColor, // 非激活时原点的颜色。
//this.activeThumbImage, //圆点还支持图片，激活时的效果
//this.inactiveThumbImage,//非激活原点的图片效果。
//this.materialTapTargetSize,
//})
class FlutterDemoSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliderStateSwitch();
}

class SliderStateSwitch extends State {
  bool isChecked = false;

  void _onCheckStateChanged(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            new Switch(
              value: isChecked,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.brown,
              activeTrackColor: Colors.blue,
              onChanged: _onCheckStateChanged,
              activeColor: Colors.green,
            ),
            Text("指定激活跟非激活状态下，圆点都为图片"),
            new Switch(
              value: isChecked,
              inactiveThumbImage: AssetImage('image/ic_launcher.png'),
              activeThumbImage: AssetImage('image/ic_launcher.png'),
              onChanged: _onCheckStateChanged,
              activeColor: Colors.green,
            ),
            new Switch(
              value: isChecked,
              onChanged: _onCheckStateChanged,
            )
          ],
        ),
      ),
    );
  }
}
//endregion

//Switch和Checkbox属性比较简单，读者可以查看API文档，它们都有一个activeColor属性，用于设置激活态的颜色。
// 至于大小，到目前为止，Checkbox的大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。
// 值得一提的是Checkbox有一个属性tristate ，表示是否为三态，其默认值为false ，
// 这时Checkbox有两种状态即“选中”和“不选中”，对应的value值为true和false ；
// 如果其值为true时，value的值会增加一个状态null，读者可以自行了解。

//region Radio 在项目开发或者真实案例中Radio通常都是成组出现，比如性别选择、爱好选择等等场景中
//构造方法
//const Radio({
//Key key,
//@required this.value,  //单选的值。
//@required this.groupValue, //选择组的值。
//@required this.onChanged,  //改变时触发。
//this.activeColor,  //激活时的颜色
//this.materialTapTargetSize,
//})
class FlutterDemoRadio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliderStateRadio();
}

class SliderStateRadio extends State {
  int _value = 0;
  String _sex = '男';

  void _onRadioChanged(int value) {
    setState(() {
      _value = value;
    });
  }

  void _onSexRadioChanged(String value) {
    setState(() {
      _sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter进阶之旅"),
      ),
      body: new Center(
        child: Column(children: <Widget>[
          Radio(
            value: 0,
            groupValue: _value,
            onChanged: _onRadioChanged,
          ),
          Radio(
            value: 1,
            groupValue: _value,
            onChanged: _onRadioChanged,
          ),
          Radio(
            value: 2,
            groupValue: _value,
            onChanged: _onRadioChanged,
          ),

          Text("选择的数字为$_value"),
          SizedBox(height: 50.0),
          Text("选择性别"),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: '男',
                groupValue: _sex,
                onChanged: _onSexRadioChanged,
              ),
              Radio(
                value: '女',
                groupValue: _sex,
                onChanged: _onSexRadioChanged,
              ),
            ],
          ),
          Text(_sex),

        ]),
      ),
    );
  }
}
//endregion



//StatelessWidget 绘制的UI页的状态包括被渲染的内容自始至终状态都不会改变
//所绘制的UI可能在未来的某个场景下发生变化我们会选用StatefullWidget来实现

//region 电影海报案例 2020年5月21日17:06:30
class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '电影海报',
        home: Scaffold(
            appBar: AppBar(title: Text('实例'), centerTitle: true),
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
//class CenterLayoutDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('中心布局'),
//      ),
//      body: new Center(
//        child: new Text('我在屏幕中央'),
//      ),
//    );
//  }
//}
//
////endregion
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