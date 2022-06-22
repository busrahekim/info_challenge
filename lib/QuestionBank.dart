import 'QuestionClass.dart';

class QuestionBank {
  int _qIndex = 0;
  List<Question> _questionBank = [
    Question(
        qSentence: "Titanic gelmiş geçmiş en büyük gemidir", answer: false),
    Question(
        qSentence: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        answer: true),
    Question(qSentence: "Kelebeklerin ömrü bir gündür", answer: false),
    Question(qSentence: "Dünya düzdür", answer: false),
    Question(
        qSentence: "Kaju fıstığı aslında bir meyvenin sapıdır", answer: true),
    Question(
        qSentence: "Fatih Sultan Mehmet hiç patates yememiştir", answer: false)
  ];
  String getQuestion() {
    return _questionBank[_qIndex].qSentence;
  }

  bool getAnswer() {
    return _questionBank[_qIndex].answer;
  }

  void nextQuestion() {
    if (_qIndex < _questionBank.length - 1) {
      _qIndex++;
    }
  }

  bool isLastQuestion() {
    if (_qIndex + 1 >= _questionBank.length) {
      return true;
    } else
      return false;
  }

  void makeZeroQIndex() {
    _qIndex = 0;
  }
}
