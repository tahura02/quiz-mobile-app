import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizHome(),
    );
  }
}

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int questionIndex = 0;
  int score = 0;

  List<Map<String, Object>> questions = [
    {
      'question': 'Flutter is developed by?',
      'options': ['Google', 'Apple', 'Microsoft'],
      'answer': 'Google'
    },
    {
      'question': 'Which language is used in Flutter?',
      'options': ['Java', 'Dart', 'Python'],
      'answer': 'Dart'
    },
    {
      'question': 'What is Flutter mainly used for?',
      'options': ['Web apps', 'Mobile apps', 'Database'],
      'answer': 'Mobile apps'
    },
  ];

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[questionIndex]['answer']) {
      score++;
    }
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz App")),
        body: Center(
          child: Text(
            "Your Score: $score",
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              questions[questionIndex]['question'] as String,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ...(questions[questionIndex]['options'] as List<String>).map(
              (option) {
                return ElevatedButton(
                  onPressed: () => answerQuestion(option),
                  child: Text(option),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
