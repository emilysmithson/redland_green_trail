import 'package:flutter/material.dart';

class Questions {
  int id;
  String question;
  List<Answers> answers;
  Questions({
    @required this.id,
    @required this.question,
    @required this.answers,
  });
}

class Answers {
  int imageNumber;
  Widget image;
  bool correct;
  Answers({
      @required this.imageNumber,
      @required this.image,
      @required this.correct,}
      );
}
List<Questions> questions = [
  Questions(
    id: 0,
    question: 'Question 1: Which of these is a Lime leaf?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/lime_leaf.jpg'),
          correct: true),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/silver_birch_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/hawthorn_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/ash_leaf.jpg'),
          correct: false),
    ],
  ),
  Questions(
    id: 1,
    question: 'Question 2: Which of these is the bark of a London Plane Tree?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/london_plane_bark.jpg',fit: BoxFit.cover,),
          correct: true),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/cherry_bark.jpg', fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/cypress_bark.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/silver_birch_bark.jpg', fit: BoxFit.cover,),
          correct: false),
    ],
  ),



  Questions(
    id: 2,
    question: 'Question 3: Which of these is an Ash leaf?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/horse_chestnut_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/ash_leaf.jpg'),
          correct: true),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/hornbeam_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/yew_leaf.jpg'),
          correct: false),
    ],
  ),

  Questions(
    id: 3,
    question: 'Question 4: Which of these is the bark of a cherry tree?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/ash_bark.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/cherry_bark.jpg', fit: BoxFit.cover,),
          correct: true),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/cypress_bark.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/london_plane_bark.jpg', fit: BoxFit.cover,),
          correct: false),
    ],
  ),
  Questions(
    id: 4,
    question: 'Question 5: Which of these leaves is an oak leaf?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/cherry_leaf.jpg',fit: BoxFit.fill,),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/ash_leaf.jpg', fit: BoxFit.fill,),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/silver_birch_leaf.jpg',fit: BoxFit.fill,),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/oak_leaf.jpg', fit: BoxFit.fill,),
          correct: true),
    ],
  ),
  Questions(
    id: 5,
    question: 'Question 6: Which of these is flower of the Horse Chestnut?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/hawthorn_blossom.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/horse_chestnut_blossom.jpg', fit: BoxFit.cover,),
          correct: true),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/mountain_ash_blossom.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/cherry_blossom.jpg', fit: BoxFit.cover,),
          correct: false),
    ],
  ),

  Questions(
    id: 6,
    question: 'Question 7: Which of these is a Hornbeam leaf?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/hornbeam_leaf.jpg'),
          correct: true),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/beech_leaf.jpg'),
          correct: false),

      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/silver_birch_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/lime_leaf.jpg'),
          correct: false),
    ],
  ),

  Questions(
    id: 7,
    question: 'Question 8: Which of these is a Purple Cherry Plum Tree?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/cherry_tree.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/hornbeam_tree.jpg', fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/horse_chestnut_tree.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/cherry_plum_tree.jpg', fit: BoxFit.cover,),
          correct: true),
    ],
  ),
  Questions(
    id: 8,
    question: 'Question 9: Which of these is a Sycamore leaf?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/sycamore_leaf.jpg'),
          correct: true),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/yew_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/silver_maple_leaf.jpg'),
          correct: false),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/london_plane_leaf.jpg'),
          correct: false),
    ],
  ),
  Questions(
    id: 9,
    question: 'Question 10: Which of these is the bark of a cypress tree?',
    answers: [
      Answers(
          imageNumber: 0,
          image: Image.asset('assets/images/ash_bark.jpg',fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 1,
          image: Image.asset('assets/images/cherry_bark.jpg', fit: BoxFit.cover,),
          correct: false),
      Answers(
          imageNumber: 2,
          image: Image.asset('assets/images/cypress_bark.jpg',fit: BoxFit.cover,),
          correct: true),
      Answers(
          imageNumber: 3,
          image: Image.asset('assets/images/silver_birch_bark.jpg', fit: BoxFit.cover,),
          correct: false),
    ],
  ),

];