import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/model/category.dart';
import 'package:yks_quiz_app/model/option.dart';
import 'package:yks_quiz_app/model/question.dart';
import 'package:yks_quiz_app/widget/options_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:flutter_html/flutter_html.dart';

class QuestionsWidget extends StatefulWidget {
  final Category category;
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

  QuestionsWidget({
    Key key,
    @required this.category,
    @required this.controller,
    @required this.onChangedPage,
    @required this.onClickedOption,
  }) : super(key: key);

  @override
  _QuestionsWidgetState createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget>
    with WidgetsBindingObserver {
  final FlutterTts flutterTts = FlutterTts();

  Future _speakQuestion(
      {@required Question question, @required String language}) async {
    await flutterTts.setQueueMode(0);
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.textSpeak);
    await flutterTts.setQueueMode(1);
    await flutterTts.setLanguage('tr-TR');
    await flutterTts.speak(question.exp);
    await flutterTts.setQueueMode(0);
  }

  Future _stopSpeaking() async {
    await flutterTts.stop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.controller.addListener(_pageChanged);
  }

  @override
  void dispose() {
    flutterTts.stop();
    WidgetsBinding.instance.removeObserver(this);
    widget.controller.removeListener(_pageChanged);
    super.dispose();
  }

  void _pageChanged() {
      flutterTts.stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      flutterTts.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: widget.onChangedPage,
      controller: widget.controller,
      itemCount: widget.category.questions.length,
      itemBuilder: (context, index) {
        final question = widget.category.questions[index];
        return buildQuestion(question: question);
      },
    );
  }

  Widget buildQuestion({@required Question question}) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isTablet = screenWidth > 600;
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100,
              ),
              child: ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: Icon(FontAwesomeIcons.microphone),
                        onPressed: () => _speakQuestion(
                            question: question, language: question.language),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 300))),
                      ),
                      ElevatedButton(
                        child: Icon(FontAwesomeIcons.stop),
                        onPressed: _stopSpeaking,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 300))),
                      ),
                    ]),
                if (widget.category.categoryName == 'AYT Matematik' ||
                    widget.category.categoryName == 'AYT Kimya')
                  Html(
                    data: question.text,
                    style: {
                      "html": Style(
                        fontSize: FontSize(isTablet ? 24 : 16),
                        textAlign: TextAlign.justify,
                      ),
                    },
                  )
                else
                  Text(
                    question.text,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: isTablet ? 24 : 16),
                    textAlign: TextAlign.justify,
                  ),
                Text(
                  question.exp,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 24 : 16),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '\n' + question.date,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 24 : 16,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
              ]),
            ),
            Text(
              'Cevabınızı seçiniz.',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: isTablet ? 16 : 12),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 1000,
              child: OptionsWidget(
                question: question,
                onClickedOption: widget.onClickedOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
