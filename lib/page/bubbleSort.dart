import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BubbleSortPage extends StatefulWidget {
  BubbleSortPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BubbleSortPageState createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
  ScrollController _scrollController = ScrollController(); //listview的控制器

  static List<int> intList = List.generate(20, (i) => 0);

  //如果b=0 标识可以进行排序，反之需要等待
  static int b = 0;

  //屏幕宽度
  static double _statusWidth;

  String _codeMarkdownData = """

```
function bubbleSort(arr) {
    var len = arr.length;
    for (var i = 0; i < len - 1; i++) {
        for (var j = 0; j < len - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {        // 相邻元素两两对比
                var temp = arr[j+1];        // 元素交换
                arr[j+1] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}
```

""";

  @override
  void initState() {

    //恢复初始值
    setState(() {
      b = 0;
    });
    _onRefresh();
  }

  Widget _renderRow(BuildContext context, int index) {
    return new Container(
      width: 25,
      alignment: Alignment.bottomLeft,
      child: new Container(
        height: (intList[index]).toDouble(),
        color: Colors.lightBlue[100 * (index % 9)],
        alignment: Alignment.topCenter,
        child: new Text(intList[index].toString(),),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          new ListView(
              children: <Widget>[

                new Column(
                  children: <Widget>[
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: new Text(
                          " ",
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                          )

                      ),
                    )
                    ,
                    new Text(
                        "      冒泡排序是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。 .",
                        textAlign: TextAlign.start,
                        softWrap: true,
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: new Text(
                          " 算法描述 ",
                          textAlign: TextAlign.start,

                          style: new TextStyle(
                            fontSize: 20.0,
                          )

                      ),
                    ),

                    new Text('''· 比较相邻的元素。如果第一个比第二个大，就交换它们两个；
                    \n· 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；
                    \n· 针对所有的元素重复以上的步骤，除了最后一个；
                    \n· 重复步骤1~3，直到排序完成。
''',
                        textAlign: TextAlign.start,
                        softWrap: true,
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      alignment: Alignment.bottomLeft,
                      child: new Text(
                          " 效果演示 ",
                          textAlign: TextAlign.start,

                          style: new TextStyle(
                            fontSize: 20.0,
                          )

                      ),
                    ),
                    Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: _renderRow,
                          itemCount: intList.length,
                          controller: _scrollController,
                        )
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      child: new Text(
                          " 代码实现 ",
                          textAlign: TextAlign.start,

                          style: new TextStyle(
                            fontSize: 20.0,
                          )

                      ),
                    ),
                    Container(
                      height: 230,
                      child: new Markdown(data: _codeMarkdownData),
                    ),

                  ],

                )
              ]
          ),
    );
  }

  @override
  void dispose() {
    print("dispose()");
    super.dispose();
    _scrollController.dispose();
  }

  /**
   * 冒泡排序
   */
  Future<Null> _bubble_Sort() async {
    var len = intList.length;

    //改变排序值状态
    setState(() {
      b = 1;
    });

    for (var i = 0; i < len - 1; i++) {
      for (var j = 0; j < len - 1 - i; j++) {
        if (0 == b) {
          return;
        }
        if (intList[j] > intList[j + 1]) {
          // 相邻元素两两对比
          await Future.delayed(Duration(seconds: 1), () {
            setState(() {
              var temp = intList[j + 1]; // 元素交换
              intList[j + 1] = intList[j];
              intList[j] = temp;
            });
          });
        }
      }
    }
    _onRefresh();
  }


  /**
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {

    await Future.delayed(Duration(seconds: 0), () {
      setState(() {
        //获取屏幕宽度
        _statusWidth = MediaQuery.of(context).size.width;

        int randomMax = 200 < _statusWidth.toInt() ? 200 : _statusWidth.toInt();
        //重置
        intList = List.generate(0, (i) => (randomMax));
        for (var i = 0; i < 20; i++) {
          int d = Random().nextInt(randomMax);
          //如果随机数小于10 再随机一次咯
          while (10 > d && 10 <= _statusWidth) {
            d = Random().nextInt(randomMax);
          }
          intList.add(d);
        }
      });

    });
    _bubble_Sort();
  }

  /**
   * 冒泡排序
   */
  Future<Null> _init_sort() async {
    //恢复初始值
    setState(() {
      b = 0;
    });

    CupertinoActivityIndicator();
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        intList = List.generate(0, (i) => 0);
      });
    });
  }

  void showAlertDialog(BuildContext context, String message) {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    debugPrint("navigator is null?" + (navigator == null).toString());

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                content: new Text(message),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("重置"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _init_sort();
                    },
                  )
                ]));
  }
}
