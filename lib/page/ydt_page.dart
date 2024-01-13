import 'package:flutter/material.dart';
import 'package:yks_quiz_app/data/questions.dart';
import 'package:yks_quiz_app/data/user.dart';
import 'package:yks_quiz_app/widget/category_header_widget.dart';
import '../data/ydt.dart';
import '../model/question.dart';

class YDS_Page extends StatefulWidget {
  @override
  _YDS_PageState createState() => _YDS_PageState();
}

class _YDS_PageState extends State<YDS_Page> {
  int correctCount = 0;
  int incorrectCount = 0;
  int unansweredCount = 0;


  List<Question> allYDSQuestions = [
    ...questions_ydt_almanca,
    ...questions_ydt_ingilizce,
    ...questions_ydt_fransizca,
  ];

  @override
  void initState() {
    super.initState();
    calculateQuestionCounts();
  }

  void calculateQuestionCounts() {
    setState(() {
      correctCount = 0;
      incorrectCount = 0;
      unansweredCount = 0;

      for (var question in allYDSQuestions) {
        if (question.selectedOption == null) {
          unansweredCount++;
        } else {
          if (question.selectedOption.isCorrect) {
            correctCount++;
          } else {
            incorrectCount++;
          }
        }
      }
    });
  }

  Widget buildStatistics() => Container(
    padding: EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStatisticItem('Doğru', correctCount),
        buildStatisticItem('Yanlış', incorrectCount),
        buildStatisticItem('İşaretlenmemiş', unansweredCount),
      ],
    ),
  );

  Widget buildStatisticItem(String title, int count) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        count.toString(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('YKS Pratik Uygulaması'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              calculateQuestionCounts();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: buildStatistics(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(height: 8),
          buildCategories(),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildCategories() {
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var isTablet = screenWidth > 600;
    return Container(
      height: 1000,
      child: GridView(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: isTablet ? 7/6 : 7 / 9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categories_ydt
            .map((category) => CategoryHeaderWidget(category: category))
            .toList(),
      ),
    );
  }
}
