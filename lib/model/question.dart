import 'package:flutter/cupertino.dart';
import 'option.dart';

class Question {
  final String language;
  final String text;
  final String textSpeak;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String optionE;
  final String exp;
  final String date;
  final List<Option> options;
  bool isLocked;
  Option selectedOption;

  Question({
    @required this.language,
    @required this.text,
    @required this.textSpeak,
    @required this.optionA,
    @required this.optionB,
    @required this.optionC,
    @required this.optionD,
    @required this.optionE,
    @required this.exp,
    @required this.date,
    @required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}
