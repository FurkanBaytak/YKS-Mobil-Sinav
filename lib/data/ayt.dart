import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_ayt = <Category>[
  Category(
    questions: questions_ayt_edebiyat,
    categoryName: 'AYT Edebiyat',
    imageUrl: 'assets/dersler/Türkçe.png',
    backgroundColor: Colors.brown,
    icon: FontAwesomeIcons.rocket,
  ),
  Category(
    questions: questions_ayt_matematik,
    imageUrl: 'assets/dersler/Matematik.png',
    categoryName: 'AYT Matematik',
    backgroundColor: Colors.green,
    icon: FontAwesomeIcons.atom,
  ),
  Category(
    questions: questions_ayt_fizik,
    imageUrl: 'assets/dersler/Fizik.png',
    categoryName: 'AYT Fizik',
    backgroundColor: Colors.teal,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_kimya,
    imageUrl: 'assets/dersler/Kimya.png',
    categoryName: 'AYT Kimya',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_biyoloji,
    imageUrl: 'assets/dersler/Biyoloji.png',
    categoryName: 'AYT Biyoloji',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_felsefe,
    imageUrl: 'assets/dersler/Felsefe.png',
    categoryName: 'AYT Felsefe',
    backgroundColor: Colors.blueGrey,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_tarih_1,
    imageUrl: 'assets/dersler/Tarih.png',
    categoryName: 'AYT Tarih 1',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_tarih_2,
    imageUrl: 'assets/dersler/Tarih2.png',
    categoryName: 'AYT Tarih 2',
    backgroundColor: Colors.redAccent,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_cografya_1,
    imageUrl: 'assets/dersler/Coğrafya.png',
    categoryName: 'AYT Coğrafya 1',
    backgroundColor: Colors.lime,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_cografya_2,
    imageUrl: 'assets/dersler/Coğrafya2.png',
    categoryName: 'AYT Coğrafya 2',
    backgroundColor: Colors.teal,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
  Category(
    questions: questions_ayt_din,
    imageUrl: 'assets/dersler/Din.png',
    categoryName: 'AYT Din Kültürü ve Ahlak Bilgisi',
    backgroundColor: Colors.green,
    icon: FontAwesomeIcons.squareRootAlt,
  ),
];
