import 'package:flutter/material.dart';
import 'package:info_challenge/QuestionBank.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> chooses = [];
  QuestionBank qb1 = QuestionBank();

  void buttonActioned(bool ans) {
    if (qb1.isLastQuestion()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Congratulations!'),
              //content: new Text('Content'),
              actions: <Widget>[
                new ElevatedButton(
                  child: new Text('Return First Question'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      qb1.makeZeroQIndex();
                      chooses = [];
                    });
                  },
                )
              ],
            );
          });
    } else {
      setState(() {
        qb1.getAnswer() == ans
            ? chooses.add(correctIcon)
            : chooses.add(wrongIcon);
        qb1.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb1.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: chooses,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            buttonActioned(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonActioned(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
