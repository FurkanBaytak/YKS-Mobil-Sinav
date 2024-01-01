import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/model/category.dart';
import 'package:yks_quiz_app/page/category_page.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CategoryHeaderWidget extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();

  Future _speakCategory({
    @required Category category,
  }) async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(category.categoryName);
  }

  final Category category;

  CategoryHeaderWidget({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryPage(category: category),
        )),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImage(),
              const SizedBox(height: 12),
              Text(
                category.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: Icon(FontAwesomeIcons.microphone),
                onPressed: () => _speakCategory(category: category),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black26),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 300))),
              ),
            ],
          ),
        ),
      );

  Widget buildImage() => Container(
    height: 150,
    decoration: BoxDecoration(
      color: category.backgroundColor,
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(category.imageUrl)),
    ),
  );
}
