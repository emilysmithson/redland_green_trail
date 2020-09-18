import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class AnswerWidget extends StatefulWidget {
  Widget answer;
  bool correct;
  int imageNumber;
  Function ButtonVisible;
  AnswerWidget(this.answer, this.correct, this.imageNumber, this.ButtonVisible);
  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

//GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
List<GlobalKey<FlipCardState>> cardKey = [
  GlobalKey<FlipCardState>(),
  GlobalKey<FlipCardState>(),
  GlobalKey<FlipCardState>(),
  GlobalKey<FlipCardState>(),
];
List<bool> _flipOnTouch = [true, true, true, true];
void reset() {
  for (int i = 0; i < 4; i++) {
    if (_flipOnTouch[i] == false) {
      cardKey[i].currentState.toggleCard();
    }
  }
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {

    Widget answer = widget.answer;
    bool correct = widget.correct;
    int imageNumber = widget.imageNumber;
    return GestureDetector(
      onTap: () {
        if (_flipOnTouch[imageNumber]) {
          cardKey[imageNumber].currentState.toggleCard();
          _flipOnTouch[imageNumber] = false;
        }
      },
      child: FlipCard(
        key: cardKey[imageNumber],
        flipOnTouch: _flipOnTouch[imageNumber],
        onFlip: () {

          if (correct) {
            setState(() {
              _flipOnTouch = [false, false, false, false];
            });
          } else {
            setState(() {
              _flipOnTouch[imageNumber] = false;
            });
          }
        },
        onFlipDone: (status) {
          if (status == false) {
            if (correct) {
              setState(() {
                widget.ButtonVisible();
              });
            }
          }
          ;
        },
        direction: FlipDirection.HORIZONTAL, // default
        front: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 4),
          ),
          height: 150,
          width: 120,
          child: answer,
        ),
        back: Container(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 4, color: correct ? Colors.green : Colors.red),
            ),
            height: 150,
            width: 120,
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
    ;
  }
}
