import 'package:flutter/material.dart';
import 'tree_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TreeInformationPage extends StatefulWidget {
  int treeNumber = 0;
  Function showQuiz;
  TreeInformationPage(this.treeNumber, this.showQuiz);
  @override
  _TreeInformationPageState createState() => _TreeInformationPageState();
}

class _TreeInformationPageState extends State<TreeInformationPage>
    with SingleTickerProviderStateMixin {
  int item = 0;
  int _currentTreeNumber = 0;
  bool useWidgetTreeNumber = true;
  ScrollController _controller = new ScrollController();
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  _setTree(int treeNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('treeNumber', treeNumber);
  }

  _nextTree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTreeNumber = (prefs.getInt('treeNumber') ?? 0) + 1;
    if (_currentTreeNumber == 21) {
      _currentTreeNumber = 0;
    }

    await prefs.setInt('treeNumber', _currentTreeNumber);
  }

  _previousTree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTreeNumber = (prefs.getInt('treeNumber') ?? 0) - 1;
    await prefs.setInt('treeNumber', _currentTreeNumber);
  }

  _reset() async {
    _currentTreeNumber = 0;
    useWidgetTreeNumber = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('treeNumber', 0);
  }

  _getTree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentTreeNumber = await prefs.getInt(
      'treeNumber' ?? 0,
    );
  }

  Future<void> _informationButtonPressed() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.green[200],
          title: Text('Deciduous vs Evergreen.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Deciduous trees drop their leaves and go dormant for a period of time.'
                    '\n\nEvergreen trees have adapted so that they do not need to drop their leaves in order to survive'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _setTree(widget.treeNumber);
    _getTree();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  AnimationController controller;

  _playAudio(i) async {
    assetsAudioPlayer.open(
      Audio(trees[i].audio),
    );

    isPlaying = !isPlaying;

    if (isPlaying) {
      controller.forward();
      assetsAudioPlayer.play();
      assetsAudioPlayer.isPlaying.listen((event) {
        if (assetsAudioPlayer.isPlaying.value == false) {
          setState(() {
            isPlaying = false;
            controller.reverse();
          });
        } else {
          setState(() {
            isPlaying = true;
            controller.forward();
          });
        }
      });
    } else {
      assetsAudioPlayer.stop();

      setState(() {
        controller.reverse();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    assetsAudioPlayer.stop();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController(initialScrollOffset: 0.0);
    int i;
    if (useWidgetTreeNumber) {
      _setTree(widget.treeNumber);
      i = widget.treeNumber;
    } else {
      _getTree();
      i = _currentTreeNumber;
    }
    return Scaffold(
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () {
            _playAudio(i);
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: controller,
          ),
        ),
      ),
      body: ListView(
        controller: _controller,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(trees[i].treeImage),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Text(
                      trees[i].id.toString(),
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green[200]),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(trees[i].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(trees[i].latinName),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trees[i].id == 0
              ? Container()
              : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(trees[i].deciduous
                              ? 'Foliage: deciduous'
                              : 'Foliage: evergreen'),

                          IconButton(
                            icon: Icon(Icons.info,color: Colors.green[200], ),
                            onPressed: () {
                              _informationButtonPressed();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Origin: ' + trees[i].origin),
                      ),
                    ],
                  ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: trees[i].description,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              i == 0
                  ? Container()
                  : RaisedButton(
                      elevation: 15.0,
                      color: Color(0xFFA5D6a7),
                      splashColor: Colors.green,
                      onPressed: () {
                        assetsAudioPlayer.stop();
                        setState(() {

                          _controller.jumpTo(0);
                          _setTree(i);
                          _previousTree();
                          useWidgetTreeNumber = false;
                        });
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Previous Tree',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
              RaisedButton(
                elevation: 15.0,
                color: Color(0xFFA5D6a7),
                splashColor: Colors.green,
                onPressed: () {
                  assetsAudioPlayer.stop();

                  if (i == 20) {
                    setState(() {
                      _reset();
                      widget.showQuiz();
                    });
                  } else {
                    setState(() {
                      _controller.jumpTo(0);
                      _setTree(i);
                      _nextTree();
                      useWidgetTreeNumber = false;
                    });
                  }
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(i == 20 ? 'Take the quiz' : 'Next Tree',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
            ],
          ),
          Container(height: 100),
        ],
      ),
    );
  }
}
