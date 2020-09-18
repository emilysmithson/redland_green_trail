import 'package:flutter/material.dart';
import 'custom_icon.dart';
import 'tree_model.dart';

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
    for (int i = 0; i < trees.length; i++) {
      treeList.add(treeCard(i));
    }
    super.initState();
  }
  List<Widget> treeList = List<Widget>();

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController(
        initialScrollOffset: widget.currentTreeNumber.toDouble() * 100);


    return ListView(controller: _controller, children: treeList);
  }

  Widget treeCard(int treeNumber) {
    return GestureDetector(
      onTap: () {
        widget.ShowTreeDescription(treeNumber);
      },
      child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      width: 80,
                      height: 100,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    trees[treeNumber].id.toString(),
                                    style: TextStyle(fontSize: 25, color: Colors.black),
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
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(trees[treeNumber].name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text(trees[treeNumber].latinName, textAlign: TextAlign.center,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: Image.asset(trees[treeNumber].leafImage),
                ),
              ),
            ],
          )),
    );
  }
}
