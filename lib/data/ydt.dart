import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_ydt = <Category>[
  Category(
    questions: questions_ydt_ingilizce,
    categoryName: 'İngilizce',
    imageUrl: 'assets/dersler/İngilizce.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
  ),

  Category(
    questions: questions_ydt_almanca,
    categoryName: 'Almanca',
    imageUrl: 'assets/dersler/Almanca.png',
    backgroundColor: Colors.teal,
    icon: FontAwesomeIcons.rocket,
  ),

  Category(
    questions: questions_ydt_fransizca,
    categoryName: 'Fransızca',
    imageUrl: 'assets/dersler/Fransızca.png',
    backgroundColor: Colors.green,
    icon: FontAwesomeIcons.rocket,
  ),

  Category(
    questions: questions_ydt_ingilizce,
    categoryName: 'Arapça',
    imageUrl: 'assets/dersler/Arapça.png',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.rocket,
  ),

  Category(
    questions: questions_ydt_ingilizce,
    categoryName: 'Rusça',
    imageUrl: 'assets/dersler/Rusça.png',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.rocket,
  ),
];