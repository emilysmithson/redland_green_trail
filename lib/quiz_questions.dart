import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'quiz_model.dart';

class Question extends StatefulWidget {
  Function ResultsPage;
  Question(this.ResultsPage);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int score = 0;
  bool _buttonVisible = false;
  int i = 0;
  bool firstTry = true;
  List<GlobalKey<FlipCardState>> cardKey = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];
  bool reset = false;
  List<bool> _flipped = [false, false, false, false];
  List<bool> _flipOnTouch = [true, true, true, true];

  @override
  Widget build(BuildContext context) {
    void ButtonVisible() {
      setState(() {
        _buttonVisible = true;
      });
    }

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            questions[i].question,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnswerWidget(
                questions[i].answers[0].image,
                questions[i].answers[0].correct,
                questions[i].answers[0].imageNumber,
                ButtonVisible,
                widget.ResultsPage),
            AnswerWidget(
                questions[i].answers[1].image,
                questions[i].answers[1].correct,
                questions[i].answers[1].imageNumber,
                ButtonVisible,
                widget.ResultsPage),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnswerWidget(
                questions[i].answers[2].image,
                questions[i].answers[2].correct,
                questions[i].answers[2].imageNumber,
                ButtonVisible,
                widget.ResultsPage),
            AnswerWidget(
                questions[i].answers[3].image,
                questions[i].answers[3].correct,
                questions[i].answers[3].imageNumber,
                ButtonVisible,
                widget.ResultsPage),
          ],
        ),
        Container(
          height: 60, width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    'Score: ' + score.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Visibility(
                    visible: _buttonVisible,
                    child: RaisedButton(
                      color: Color(0xFFA5D6a7),
                      splashColor: Colors.green,
                      onPressed: () {
                        reset = true;
                        setState(() {
                          Reset();
                        });
                      },

                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Next Question',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void Reset() {
    reset = true;
    for (int i = 0; i < 4; i++) {
      if (_flipped[i] == true) {
        setState(() {
          cardKey[i].currentState.toggleCard();
        });
      }
      _flipOnTouch[i] = true;
      _flipped[i] = false;
    }
    _buttonVisible = false;
  }

  Widget AnswerWidget(Widget answer, bool correct, int imageNumber,
      Function ButtonVisible, Function ResultsPage) {
    return GestureDetector(
      onTap: () {
        if (_flipOnTouch[imageNumber]) {

          _flipped[imageNumber] = true;
          cardKey[imageNumber].currentState.toggleCard();

          _flipOnTouch[imageNumber] = false;

        }
      },
      child: FlipCard(
        key: cardKey[imageNumber],
        flipOnTouch: _flipOnTouch[imageNumber],
        onFlip: () {
          if(!correct){firstTry = false;}
          setState(() {
            _flipped[imageNumber] = true;
            _flipOnTouch[imageNumber] = false;
          });
        },
        onFlipDone: (status) {
          if (status == false) {
            if (correct) {
              setState(() {
                if (firstTry) {
                  score = score + 1;
                }
                ButtonVisible();
              });
            }
          } else {
            if (reset) {
              firstTry = true;
              setState(() {
                if (i < 9) {
                  i = i + 1;
                } else {
                  ResultsPage(score);
                }
                reset = false;
              });
            }
          }
        },
        direction: FlipDirection.HORIZONTAL, // default
        front: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 4),
          ),
          height: MediaQuery.of(context).size.width/2*0.9,
          width: MediaQuery.of(context).size.width/2*0.8,
          child: answer,
        ),
        back: Container(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 4, color: correct ? Colors.green : Colors.red),
            ),
            height: MediaQuery.of(context).size.width/2*0.9,
            width: MediaQuery.of(context).size.width/2*0.8,
            child: Center(
                child: correct
                    ? Text(
                        'Correct!',
                        style: TextStyle(fontSize: 25),
                      )
                    : Text(
                        'Wrong!',
                        style: TextStyle(fontSize: 25),
                      )),
          ),
        ),
      ),
    );
  }
}
