import 'package:flutter/material.dart';
import 'package:flutter_sort/page/sort/listSort.dart';
 import 'package:flutter_sort/model/SortValueModel.dart';
import 'package:flutter_sort/page/author/author.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("经典排序算法"),),  //头部的标题AppBar
      drawer: new Drawer(     //侧边栏按钮Drawer
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(   //Material内置控件
              accountName: new Text('壳叔'), //用户名
              accountEmail: new Text('keshu@bhusk.com'),  //用户邮箱
              currentAccountPicture: new GestureDetector( //用户头像
                onTap: () => print('current user'),
                child: new CircleAvatar(    //圆形图标控件
                  backgroundImage: new NetworkImage('https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),//图片调取自网络
                ),
              ),
              decoration: new BoxDecoration(    //用一个BoxDecoration装饰器提供背景图片
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  // image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg')
                  //可以试试图片调取自本地。调用本地资源，需要到pubspec.yaml中配置文件路径
                  image: new ExactAssetImage('images/lake.jpg'),
                ),
              ),
            ),
            new ListTile(
                title: new Text('冒泡排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:bubbleSort_title ,value: bubbleSort_value,)));
                }
            ),new ListTile(
                title: new Text('选择排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:selection_title ,value: selection_value,)));
                }
            ),new ListTile(
                title: new Text('插入排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Insertion_title ,value: Insertion_value,)));
                }
            ),new ListTile(
                title: new Text('希尔排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Shell_title ,value: Shell_value,)));
                }
            ),new ListTile(
                title: new Text('归并排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Merge_title ,value: Merge_value,)));
                }
            ),new ListTile(
                title: new Text('快速排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Quick_title ,value: Quick_value,)));
                }
            ),new ListTile(
                title: new Text('堆排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Heap_title ,value: Heap_value,)));
                }
            ),new ListTile(
                title: new Text('计数排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Counting_title ,value: Counting_value,)));
                }
            ),new ListTile(
                title: new Text('桶排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Bucket_title ,value: Bucket_value,)));
                }
            ),new ListTile(
                title: new Text('基数排序'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListSortPage(title:Radix_title ,value: Radix_value,)));
                }
            ),
            new ListTile(   //第二个功能项
                title: new Text('关于程序'),
                 onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AuthorPage(title: '关于程序')));
                }
            ),
            new Divider(),    //分割线控件
            new ListTile(   //退出按钮
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
            ),
          ],
        ),
      ),  //侧边栏按钮Drawer
      body: new Center(  //中央内容部分body
        child: new Markdown(data: _markdownData),
      ),


    );
  }
}

const String _markdownData = """
# 十大经典排序算法
 
###  算法概述
####  算法分类

十种常见排序算法可以分为两大类：

> **非线性时间比较类排序**：通过比较来决定元素间的相对次序，由于其时间复杂度不能突破O(nlogn)，因此称为非线性时间比较类排序。
> 
> **线性时间非比较类排序**：不通过比较来决定元素间的相对次序，它可以突破基于比较排序的时间下界，以线性时间运行，因此称为线性时间非比较类排序。 
 
![](http://qiniu.blackdir.com/849589-20180402132530342-980121409.png)

####  算法复杂度

![](http://qiniu.blackdir.com/849589-20180402133438219-1946132192.png)

#### 相关概念 

> **稳定**：如果a原本在b前面，而a=b，排序之后a仍然在b的前面。
> 
> **不稳定**：如果a原本在b的前面，而a=b，排序之后 a 可能会出现在 b 的后面。
> 
> **时间复杂度**：对排序数据的总的操作次数。反映当n变化时，操作次数呈现什么规律。
> 
> **空间复杂度：**是指算法在计算机内执行时所需存储空间的度量，它也是数据规模n的函数。
""";
