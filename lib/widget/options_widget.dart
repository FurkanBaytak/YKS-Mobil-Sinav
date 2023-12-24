import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/model/option.dart';
import 'package:yks_quiz_app/model/question.dart';
import 'package:yks_quiz_app/utils.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;


  final FlutterTts flutterTts = FlutterTts();
  Future _speakOptionA({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionA);
  }

  Future _speakOptionB({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionB);
  }

  Future _speakOptionC({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionC);
  }

  Future _speakOptionD({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionD);
  }

  Future _speakOptionE({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionE);
  }



   OptionsWidget({
    Key key,
    @required this.question,
    @required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        physics: BouncingScrollPhysics(),
        children: Utils.heightBetween(
          question.options
              .map((option) => buildOption(context, option))
              .toList(),
          height: 8,
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option,question),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option, Question question) => Container(
        height: 100,
        child: Row(children: [
          SizedBox(width: 12),
          ElevatedButton(
              child: Icon(FontAwesomeIcons.microphone),
              onPressed: () {
                if(option.code == 'A')
                  return _speakOptionA(question: question);
                else if(option.code == 'B')
                  return _speakOptionB(question: question);
                else if(option.code == 'C')
                  return _speakOptionC(question: question);
                else if(option.code == 'D')
                  return _speakOptionD(question: question);
                else
                  return _speakOptionE(question: question);
              }
          ),
          SizedBox(width: 12),
          Text(
            option.code,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(width: 12),
          Flexible(child: Text(
            option.text,
            style: TextStyle(fontSize: 20),
          ))
        ]),
      );

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return option.isCorrect ? Colors.green : Colors.red;
    }
  }
}
