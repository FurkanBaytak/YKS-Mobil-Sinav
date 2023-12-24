import 'package:flutter/material.dart';
import 'package:yks_quiz_app/data/user.dart';
import 'package:yks_quiz_app/widget/category_header_widget.dart';
import '../data/yds.dart';

class YDS_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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

  Widget buildCategories() => Container(
        height: 1000,
        child: GridView(
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categories_yds
              .map((category) => CategoryHeaderWidget(category: category))
              .toList(),
        ),
      );


}
