import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'questionbank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15), child: Quizapp()),
        ),
      ),
    );
  }
}

class Quizapp extends StatefulWidget {
  const Quizapp({super.key});

  @override
  State<Quizapp> createState() => _QuizappState();
}

class _QuizappState extends State<Quizapp> {
  @override

  // List<bool> answers=[
  //   false,
  //   false,
  //   true,
  //   true,
  //   true
  // ];
  // List<String> Questions=[
  //   'The star sign Aquarius is represented by a tiger',
  //   '\'A\' is the most common letter used in the English language',
  //   'ASOS stands for As Seen On Screen',
  //   'The Battle Of Hastings took place in 1066',
  //   'H&M stands for Hennes & Mauritz'
  // ];
//   List<Question> Questionbank=[
//   Question(q: 'The star sign Aquarius is represented by a tiger', a: false),
//   Question(q: '\'A\' is the most common letter used in the English language', a: false),
//     Question(q: 'ASOS stands for As Seen On Screen', a: true),
//     Question(q: 'The Battle Of Hastings took place in 1066', a: true),
//     Question(q: 'H&M stands for Hennes & Mauritz', a: true)
// ];
  List<Widget> superpower=[];
  Ques quisbnk= Ques();
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                quisbnk.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green
              ),
            onPressed:(){
                setState(() {
                  bool correct=quisbnk.getAnswer();

                  if (correct == true){
                    quisbnk.scores();
                    superpower.add(Icon(Icons.check,
                      color: Colors.green,
                    )
                    );
                  }
                  else{
                    superpower.add(Icon(Icons.clear,
                      color: Colors.red,
                    )
                    );
                  }
                  if(quisbnk.isfinished()==true){

                    Alert(
                        context: context,
                        title: 'Quiz Completed',
                        desc: 'Your Score is ${quisbnk.displayscore()} out of ${quisbnk.displayT()}'
                    ).show();
                  }
                  quisbnk.nextQuestion();
                  }


              );
            }, child: Text('True')),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 7, 10, 20),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red
                ),
                onPressed:(){
                  setState(() {
                    bool correct=quisbnk.getAnswer();
                    if (correct == false){
                      quisbnk.scores();
                      superpower.add(Icon(Icons.check,
                        color: Colors.green,
                      )
                      );
                    }
                    else{
                      superpower.add(Icon(Icons.clear,
                        color: Colors.red,
                      )
                      );
                    }
                    if(quisbnk.isfinished()==true){

                      Alert(
                          context: context,
                          title: 'Quiz Completed',
                          desc: 'Your Score is ${quisbnk.displayscore()} out of ${quisbnk.displayT()}'
                      ).show();
                    }
                    quisbnk.nextQuestion();
                  });
                }, child: Text('False')),
          ),
        ),
        Row(
          children:
                superpower,

        )
      ],
    );

  }
}
