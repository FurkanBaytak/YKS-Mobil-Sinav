import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/model/option.dart';
import 'package:yks_quiz_app/model/question.dart';
import 'package:yks_quiz_app/utils.dart';
import 'package:flutter_html/flutter_html.dart';

class OptionsWidget extends StatefulWidget {
  final PageController controller;
  final Question question;
  final ValueChanged<Option> onClickedOption;

  OptionsWidget({
    Key key,
    @required this.question,
    @required this.controller,
    @required this.onClickedOption,
  }) : super(key: key);

  @override
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget>{
  final FlutterTts flutterTts = FlutterTts();

  Future _speakSelectedOption(String optionCode) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak("$optionCode şıkkını işaretlediniz");
  }


  Future _speakOptionA(
      {@required Question question, @required String language}) async {
    flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionA);
  }

  Future _speakOptionB(
      {@required Question question, @required String language}) async {
    flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionB);
  }

  Future _speakOptionC(
      {@required Question question, @required String language}) async {
    flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionC);
  }

  Future _speakOptionD(
      {@required Question question, @required String language}) async {
    flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionD);
  }

  Future _speakOptionE(
      {@required Question question, @required String language}) async {
    flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.optionE);
  }


  @override
  Widget build(BuildContext context) => ListView(
    physics: BouncingScrollPhysics(),
    children: Utils.heightBetween(
      widget.question.options
          .map((option) => buildOption(context, option))
          .toList(),
      height: 8,
    ),
  );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, widget.question);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.question.selectedOption == option) {
            widget.question.selectedOption = null;
          } else {
            widget.question.selectedOption = option;
            widget.onClickedOption(option);
          }
        });
        _speakSelectedOption(option.code);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option, widget.question),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option, Question question) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isTablet = screenWidth > 600;
    return SingleChildScrollView(
      child: Container(
        child: Row(children: [
          SizedBox(width: 12),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(isTablet ? 16 : 12, isTablet ? 32 : 24)),),
              child: Icon(FontAwesomeIcons.microphone, size: isTablet ? 20 : 13),
              onPressed: () {
                if (option.code == 'A')
                  return _speakOptionA(
                      question: question, language: question.language);
                else if (option.code == 'B')
                  return _speakOptionB(
                      question: question, language: question.language);
                else if (option.code == 'C')
                  return _speakOptionC(
                      question: question, language: question.language);
                else if (option.code == 'D')
                  return _speakOptionD(
                      question: question, language: question.language);
                else
                  return _speakOptionE(
                      question: question, language: question.language);
              }),
          SizedBox(width: 12),
          Text(
            option.code,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 24 : 16),
          ),
          SizedBox(width: 12),
          Flexible(
            child: _buildOptionText(option, question),
          )
        ]),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return option.isCorrect ? Colors.lightBlueAccent : Colors.lightBlueAccent;
    }
  }

  Widget _buildOptionText(Option option, Question question) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isTablet = screenWidth > 600;
    if (question.optionB == 'Gümüş elektrodun kütlesi zamanla azalır.') {
      return Html(
        data: option.text,
        style: {
          "html": Style(
            fontSize: FontSize(isTablet ? 20 : 13),
            textAlign: TextAlign.justify,
          ),
        },
      );
    } else {
      return Text(
        option.text,
        style: TextStyle(fontSize: isTablet ? 20 : 13),
      );
    }
  }
}
