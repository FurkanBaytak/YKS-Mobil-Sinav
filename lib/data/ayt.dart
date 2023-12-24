import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_ayt = <Category>[
  Category(
    questions: questions_ayt_edebiyat,
    categoryName: 'AYT Edebiyat',
    imageUrl: 'assets/physics.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
  ),
  Category(
    questions: questions_ayt_matematik,
    imageUrl: 'assets/chemistry.png',
    categoryName: 'AYT Matematik',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
  ),
  Category(
    questions: questions_ayt_fizik,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Fizik',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_kimya,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Kimya',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_biyoloji,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Biyoloji',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_tarih,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Tarih',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_cografya,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Coğrafya',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_felsefe,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Felsefe',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_din,
    imageUrl: 'assets/maths.png',
    categoryName: 'AYT Din Kültürü ve Ahlak Bilgisi',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
];
