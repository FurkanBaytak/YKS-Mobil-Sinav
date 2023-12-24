import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/model/category.dart';
import 'package:yks_quiz_app/model/option.dart';
import 'package:yks_quiz_app/model/question.dart';
import 'package:yks_quiz_app/widget/options_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QuestionsWidget extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();

  Future _speakQuestion({
    @required Question question,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(question.text + question.exp);

  }

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
  Widget build(BuildContext context) => PageView.builder(
        onPageChanged: onChangedPage,
        controller: controller,
        itemCount: category.questions.length,
        itemBuilder: (context, index) {
          final question = category.questions[index];
          return buildQuestion(question: question);
        },
      );

  Widget buildQuestion({
    @required Question question,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: ListView(children: [
                  ElevatedButton(
                    child: Icon(FontAwesomeIcons.microphone),
                    onPressed: () => _speakQuestion(question: question),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 300))),
                  ),
                  Text(
                    question.text,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    question.exp,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.justify,
                  ),
                ]),
              ),
              Text(
                'Cevabınızı seçiniz.',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 1000,
                child: OptionsWidget(
                  question: question,
                  onClickedOption: onClickedOption,
                ),
              ),
            ],
          ),
        ),
      );
}
