import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yks_quiz_app/data/user.dart';
import 'package:yks_quiz_app/page/ayt_page.dart';
import 'package:yks_quiz_app/page/tyt_page.dart';
import 'package:yks_quiz_app/page/ydt_page.dart';

import '../model/category.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePage createState() => _ChoosePage();
}

final FlutterTts flutterTts = FlutterTts();

Future _speakLesson(String s) async {
  await flutterTts.setLanguage("tr-TR");
  await flutterTts.setPitch(1);
  await flutterTts.speak(s);
}

class _ChoosePage extends State<ChoosePage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('YKS Pratik Uygulaması'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: buildWelcome(username),
          ),
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
      body: SafeArea(
        child: _buildColumn(),
      ),
    );
  }

  Widget _buildColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          // First blue container
          _buildTopContainer(),
          SizedBox(height: 10),
          // Button with offset
          _buildMidContainer(),
          SizedBox(height: 10),
          // Bottom white container
          _buildBottomContainer(),
          SizedBox(height: 10),
        ],
      );

  Widget _buildTopContainer() => Flexible(
        flex: 5,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TYT_Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.redAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TYT',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  child: Icon(FontAwesomeIcons.microphone),
                  onPressed: () => _speakLesson('Temel Yeterlilik Testi'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black26),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 300))),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildMidContainer() => Flexible(
        flex: 5,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AYT_Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AYT',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  child: Icon(FontAwesomeIcons.microphone),
                  onPressed: () => _speakLesson('Alan Yeterlilik Testi'),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.black26),
                      textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 300))),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildBottomContainer() => Flexible(
        flex: 5,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YDS_Page()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber, Colors.amberAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'YDT',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    child: Icon(FontAwesomeIcons.microphone),
                    onPressed: () => _speakLesson('Yabancı Dil Testi'),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black26),
                        textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 300))),
                  ),
            ]),
          ),
        ),
      );
  Widget buildWelcome(String username) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Merhaba,',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            username,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      );
}
