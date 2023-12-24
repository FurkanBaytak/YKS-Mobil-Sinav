import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_tyt = <Category>[
  Category(
    questions: questions_tyt_turkce,
    categoryName: 'TYT Türkçe',
    imageUrl: 'assets/physics.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
  ),
  Category(
    questions: questions_tyt_matematik,
    imageUrl: 'assets/chemistry.png',
    categoryName: 'TYT Matematik',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
  ),
  Category(
    questions: questions_tyt_fizik,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Fizik',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_kimya,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Kimya',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_biyoloji,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Biyoloji',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_tarih,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Tarih',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_cografya,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Coğrafya',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_felsefe,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Felsefe',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_din,
    imageUrl: 'assets/maths.png',
    categoryName: 'TYT Din Kültürü ve Ahlak Bilgisi',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
];
