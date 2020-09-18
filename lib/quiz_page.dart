import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'quiz_questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int pageNumber = 0;
  int _score;
  void ResultsPage(int score) {
    setState(() {
      _score = score;
      pageNumber = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return pageNumber == 0
        ? quizIntro()
        : pageNumber == 1 ? Question(ResultsPage) : quizResults();
  }

  Widget quizResults() {
    return Stack(
      children: <Widget>[
        Container(height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(MediaQuery.of(context).orientation==Orientation.portrait?
            'assets/images/leaves.jpeg': 'assets/images/leaves_landscape.jpeg', fit: BoxFit.fill
            ),
          ),
        ),
        Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'You scored  ' + _score.toString() + ' out of 10',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _score == 10
                    ? 'Fantastic! You really know your trees!'
                    : _score > 5 ? 'Well done!' : 'Have another go!',
                style: TextStyle(fontSize: 30), textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    pageNumber = 1;
                  });
                },
                color: Color(0xFFA5D6a7),
                elevation: 15.0,
                splashColor: Colors.green,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Try again',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget quizIntro() {
    return Stack(
      children: <Widget>[
        Container(height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(MediaQuery.of(context).orientation==Orientation.portrait?
            'assets/images/leaves.jpeg': 'assets/images/leaves_landscape.jpeg', fit: BoxFit.fill
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Tree Quiz',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Test your knowledge with these 10 multiple choice questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                color: Color(0xFFA5D6a7),
                elevation: 15.0,
                splashColor: Colors.green,
                onPressed: () {
                  setState(() {
                    pageNumber = 1;
                  });
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Start Quiz',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
