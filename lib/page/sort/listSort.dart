
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';



class ListSortPage extends StatefulWidget {
  ListSortPage({Key key, this.title,this.value}) : super(key: key);

  final String title;
  final String value;
  @override
  _ListSortPageState createState() => _ListSortPageState();
}

class _ListSortPageState extends State<ListSortPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Markdown(data: widget.value),
    );
  }

}
