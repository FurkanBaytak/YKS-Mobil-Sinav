import 'package:flutter/material.dart';
import 'package:yks_quiz_app/widget/category_header_widget.dart';
import '../data/questions.dart';
import '../data/tyt.dart';
import '../model/question.dart';

class TYT_Page extends StatefulWidget {
  @override
  _TYT_PageState createState() => _TYT_PageState();
}

class _TYT_PageState extends State<TYT_Page> {
  void updateQuestionStatistics() {
    calculateQuestionCounts();
  }

  int correctCount = 0;
  int incorrectCount = 0;
  int unansweredCount = 0;
  PageController pageController;

  List<Question> allTYTQuestions = [
    ...questions_tyt_turkce,
    ...questions_tyt_matematik,
    ...questions_tyt_fizik,
    ...questions_tyt_kimya,
    ...questions_tyt_biyoloji,
    ...questions_tyt_cografya,
    ...questions_tyt_tarih,
    ...questions_tyt_din,
    ...questions_tyt_felsefe,
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(_pageChanged);
    calculateQuestionCounts();
  }

  @override
  void dispose() {
    pageController.removeListener(_pageChanged);
    pageController.dispose();
    super.dispose();
  }

  void _pageChanged() {
    calculateQuestionCounts();
  }

  void calculateQuestionCounts() {
    setState(() {
      correctCount = 0;
      incorrectCount = 0;
      unansweredCount = 0;

      for (var question in allTYTQuestions) {
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

  // AppBar'da soru istatistiklerini gösteren widget
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

  // Tek bir istatistik öğesini oluşturan widget
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
    calculateQuestionCounts();
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
          preferredSize: Size.fromHeight(80), // AppBar'ın boyutunu ayarlayın
          child: buildStatistics(), // Soru sayılarını gösteren widget
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
          SizedBox(height: 16),
          buildCategories(),
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
          childAspectRatio: isTablet ? 7/7 : 7/9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categories_tyt
            .map((category) => CategoryHeaderWidget(category: category))
            .toList(),
      ),
    );
  }
}
