import 'package:flutter/material.dart';
import 'package:redland_green_trail/custom_icon.dart';
import 'custom_icon.dart';
import 'map.dart';
import 'list_page.dart';
import 'tree_information_page.dart';

import 'tree_model.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'quiz_page.dart';
import 'information_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redland Green Tree Trail',
      theme: ThemeData(primaryColor: Colors.green),
      home: MyHomePage(title: 'Redland Green Tree Trail'),
        debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _treeNumber = 0;
  int _currentTreeNumber = 0;

  bool playButtonVisible = true;
  String audioFile = 'audios/introduction.wav';
  Animation<double> animation;
  AnimationController controller;
  TabController tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    _getTreeNumber();
    tabController = TabController(vsync: this, length: 5);
    tabController.addListener(() {
      setState(() {
        _selectedIndex = tabController.index;
      });
    });


    super.initState();
  }

  void showTreeInformation(int treeNumber) {
    setState(() {
      _treeNumber = treeNumber;
    });
    tabController.animateTo(3);
  }

  void _showQuiz() {
    setState(() {
      _currentTreeNumber = 0;
      tabController.animateTo(4);
    });
  }

  _getTreeNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTreeNumber = (prefs.getInt('treeNumber') ?? 0);
    _treeNumber = _currentTreeNumber;
  }

  _nextTree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTreeNumber = (prefs.getInt('treeNumber') ?? 0) + 1;
    await prefs.setInt('treeNumber', _currentTreeNumber);
  }

  @override
  Widget build(BuildContext context) {


    void _onItemTapped(int index) {
      _getTreeNumber();
      setState(() {
        tabController.animateTo(index);
        _selectedIndex = index;
      });
    }

    List<Widget> pages = [
      HomePage(),
      MapPage(showTreeInformation, _currentTreeNumber),
      ListPage(showTreeInformation, _currentTreeNumber),
      TreeInformationPage(_treeNumber, _showQuiz),
      QuizPage(),
    ];
    if (_selectedIndex == 0) {
      playButtonVisible = true;
      audioFile = 'audios/introduction.wav';
    } else if (_selectedIndex == 3) {
      playButtonVisible = true;
      audioFile = trees[_treeNumber].audio;
    } else {
      playButtonVisible = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Redland Green Tree Trail'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformationPage()),
              );
            },
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: TabBarView(
        physics: _selectedIndex == 1
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        children: pages,
        controller: tabController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.tree),
            title: Text('Tree'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Quiz'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
