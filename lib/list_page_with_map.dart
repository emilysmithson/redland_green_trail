import 'package:flutter/material.dart';
import 'custom_icon.dart';
import 'tree_model.dart';
import 'map.dart';

class ListPage extends StatefulWidget {
  Function ShowTreeDescription;
  int currentTreeNumber;
  ListPage(this.ShowTreeDescription, this.currentTreeNumber);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    for (int i = 0; i < 21; i++) {
      treeList.add(treeCard(i));
    }
    super.initState();
  }
  List<Widget> treeList = List<Widget>();

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController(
        initialScrollOffset: widget.currentTreeNumber.toDouble() * 100);


    return Row(
      children: <Widget>[Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: treeList),
        Expanded(child: MapPage(widget.ShowTreeDescription,widget.currentTreeNumber)),

      ],
    );
  }

  Widget treeCard(int treeNumber) {
    return GestureDetector(
      onTap: () {
        widget.ShowTreeDescription(treeNumber);
      },
      child: Container(width: 200, height:44,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: 20,
                    height: 20,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: Text(
                              trees[treeNumber].id.toString(),
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                              trees[treeNumber].id <widget.currentTreeNumber
                                      ? Colors.grey
                                      : Colors.green[200]),
                        ),
                      ],
                    )))
              ],
            ),
            Text(trees[treeNumber].name,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),

            Container(
              width: 44.0,
              height: 44.0,
              child: Image.asset(trees[treeNumber].leafImage),
            ),
          ],
        )),
      ),
    );
  }
}
