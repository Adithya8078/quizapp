import 'question.dart';

class Ques{
  int _score=0;
int _quesNumber=0;
  List<Question> _Questionbank=[
    Question(q: 'The star sign Aquarius is represented by a tiger', a: false),
    Question(q: '\'A\' is the most common letter used in the English language', a: false),
    Question(q: 'ASOS stands for As Seen On Screen', a: true),
    Question(q: 'The Battle Of Hastings took place in 1066', a: true),
    Question(q: 'H&M stands for Hennes & Mauritz', a: true)
  ];
  void nextQuestion(){
    if(_quesNumber<_Questionbank.length-1){
      _quesNumber++;
    }
  }
  String getQuestion(){

      return _Questionbank[_quesNumber].questionText;



  }
  bool getAnswer(){
    return _Questionbank[_quesNumber].questionAnswer;
  }
 bool isfinished(){
    if(_quesNumber ==_Questionbank.length-1){
      return true;
    }
    else{
      return false;
    }
 }
 void scores(){
    _score=_score+1;
 }
 int displayscore(){
    return _score;

 }
 int displayT(){
    return _Questionbank.length;
 }
}
