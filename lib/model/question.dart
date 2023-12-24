import 'package:flutter/cupertino.dart';
import 'option.dart';

class Question {
  final String text;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String optionE;
  final String exp;
  final List<Option> options;
  bool isLocked;
  Option selectedOption;

  Question({
    @required this.text,
    @required this.optionA,
    @required this.optionB,
    @required this.optionC,
    @required this.optionD,
    @required this.optionE,
    @required this.exp,
    @required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}
