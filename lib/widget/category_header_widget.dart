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
  Widget build(BuildContext context){
    var screenWidth = MediaQuery.of(context).size.width;
    var isTablet = screenWidth > 600;
   return GestureDetector(

        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryPage(category: category),
        )),
        child: Container(
          padding: EdgeInsets.all(isTablet ? 16 : 12),
          decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImage(isTablet),
              const SizedBox(height: 12),
              Text(
                category.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 20 : 12,

                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black26),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () => _speakCategory(category: category),
                child: Container(
                  width: isTablet ? 50 : 30,
                  height: isTablet ? 50 : 30,
                  alignment: Alignment.center,
                  child: Icon(FontAwesomeIcons.microphone, size: isTablet ? 24 : 16),
                ),
              ),

            ],
          ),
        ),
      );
  }

  Widget buildImage(bool isTablet) => Container(
    height: isTablet ? 100 : 30,
    decoration: BoxDecoration(
      color: category.backgroundColor,
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(category.imageUrl)),
    ),
  );
}
