import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Quiz app",
    home: MyQuizePage(),
  ));
}

class MyQuizePage extends StatefulWidget {
  const MyQuizePage({Key? key}) : super(key: key);

  @override
  _MyQuizePageState createState() => _MyQuizePageState();
}

class Question {
  String questionText;
  bool isCorrect;
  String image;

  Question({required this.questionText, required this.isCorrect, required this.image});
}

class _MyQuizePageState extends State<MyQuizePage> {
  int questionId = 1;

  var questions = [
    Question(questionText: 'Leonardo DiCaprio a remporté son premier Oscar pour "Inception".', isCorrect: false, image: '1.jpg'),
    Question(questionText: '"Avatar" a été réalisé par James Cameron.', isCorrect: true, image: '2.jpg'),
    Question(questionText: 'Le personnage de "Forrest Gump" a été interprété par Tom Hanks.', isCorrect: true, image: '3.jpg'),
    Question(questionText: '"Parasite" a remporté l\'Oscar du meilleur film en 2020.', isCorrect: true, image: '4.png'),
    Question(questionText: '"Le Seigneur des Anneaux : Le Retour du Roi" a remporté 11 Oscars.', isCorrect: true, image: '5.jpg'),
    Question(questionText: '"Harry Potter" est une série de films basée sur des romans de J.R.R. Tolkien.', isCorrect: false, image: '6.jpg'),
    Question(questionText: '"La Liste de Schindler" a été réalisé par Steven Spielberg.', isCorrect: true, image: '7.jpg'),
    Question(questionText: '"Interstellar" est un film de Christopher Nolan.', isCorrect: true, image: '8.jpg'),
  ];

  void updateQuestions() {
    if (questionId != questions.length - 1) {
      questionId = questionId + 1;
    } else {
      questionId = 0;
    }
  }

  SnackBar correctAnswer() {
    var snackMessage = "c'est vrai !";
    return SnackBar(
      content: Text(snackMessage),
    );
  }

  SnackBar badAnswer() {
    var snackMessage = "non c'est faux";
    return SnackBar(
      content: Text(snackMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("Quiz ciné"), centerTitle: true,),
      body:
      SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset('images/' + questions[questionId].image),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            questions[questionId].questionText,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ))),
                Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (questions[questionId].isCorrect == true) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(correctAnswer());
                                        updateQuestions();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(badAnswer());
                                      }
                                    });
                                  },
                                  child: Text("Vrai")),
                            )),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (questions[questionId].isCorrect == false) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(correctAnswer());
                                      updateQuestions();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(badAnswer());
                                    }
                                  });
                                },
                                child: Text("Faux")))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          updateQuestions();
                        });
                      },
                      child: Icon(
                        Icons.arrow_forward,
                      )),
                )
              ],
            )),
      ),
    );
  }
}

_checkAnswer(bool userchoice, BuildContext context) {}

_nextQuestion() {}
