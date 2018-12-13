
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _markdownData = """
# Flutter Sort 

- Flutter 编写的十大经典排序算法 包含效果演示

## version
```
V0.1
1、提高用户体验度
2、增加主页内容页面
3、新增冒泡排序算法页面
4、新增关于程序页面
```

## 留言

首先非常感谢你使用本App,其次本程序纯由我一人(是个做后端的程序猿)编写，我已经尽力提高APP的体验度了

顺便提一下我的博客 <a href="http://blog.bhusk.com/">http://blog.bhusk.com/</a>

程序员是个辛苦的职业

请善待你们身边的每一位程序员~

欢迎扫描二维码加入我们的小组织 ，大家都叫我壳叔，很期待你的到来。
黑壳网交流群 Q 群:[200408242](http://shang.qq.com/wpa/qunwpa?idkey=25b503daf8d907bcb7cbcecd2ee512ef6cad4bd31f048bea7b0103a17397cf7a)

![11a84075a304ac57f6d37323512fd24cde9836350b9d80148b282eeaa188b196c2358d4ffd7006cbpng](http://qiniu.blackdir.com/11a84075a304ac57f6d37323512fd24cde983635-0b9d80148b282eeaa188b196c2358d4ffd7006cb.png)
""";

class AuthorPage extends StatefulWidget {
  AuthorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AuthorPageState createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Markdown(data: _markdownData),
    );
  }

}
