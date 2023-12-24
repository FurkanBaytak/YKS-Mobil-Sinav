import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/model/category.dart';

final categories_yds = <Category>[
  Category(
    questions: questions_yds_ingilizce,
    categoryName: 'İngilizce',
    imageUrl: 'assets/physics.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
  ),
];