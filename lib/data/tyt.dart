import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_tyt = <Category>[
  Category(
    questions: questions_tyt_turkce,
    categoryName: 'TYT Türkçe',
    imageUrl: 'assets/dersler/Türkçe.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
  ),
  Category(
    questions: questions_tyt_matematik,
    imageUrl: 'assets/dersler/Matematik.png',
    categoryName: 'TYT Matematik',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
  ),
  Category(
    questions: questions_tyt_fizik,
    imageUrl: 'assets/dersler/Fizik.png',
    categoryName: 'TYT Fizik',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_kimya,
    imageUrl: 'assets/dersler/Kimya.png',
    categoryName: 'TYT Kimya',
    backgroundColor: Colors.teal,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_biyoloji,
    imageUrl: 'assets/dersler/Biyoloji.png',
    categoryName: 'TYT Biyoloji',
    backgroundColor: Colors.green,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_tarih,
    imageUrl: 'assets/dersler/Tarih.png',
    categoryName: 'TYT Tarih',
    backgroundColor: Colors.brown,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_cografya,
    imageUrl: 'assets/dersler/Coğrafya.png',
    categoryName: 'TYT Coğrafya',
    backgroundColor: Colors.redAccent,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_felsefe,
    imageUrl: 'assets/dersler/Felsefe.png',
    categoryName: 'TYT Felsefe',
    backgroundColor: Colors.lime,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_tyt_din,
    imageUrl: 'assets/dersler/Din.png',
    categoryName: 'TYT Din Kültürü ve Ahlak Bilgisi',
    backgroundColor: Colors.blueGrey,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
];
