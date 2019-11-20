// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ihc_project/favorite.dart';
import 'package:ihc_project/ratings.dart';
import 'package:ihc_project/report_problem.dart';
import 'package:ihc_project/status.dart';

class DetailScreen extends StatelessWidget {

  Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
    ),
  );

  Widget itemRating = Container(
    child: Row(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 1),
            child: Text(
              'Qualidade Número 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          FlutterRatingBar(
            initialRating: 3,
            itemSize: 24,
            fillColor: Colors.amber,
            borderColor: Colors.amber.withAlpha(50),
            allowHalfRating: false,
            onRatingUpdate: (rating) {
                print(rating);
            },
        ),
      ],
    ),
  );

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ItemStatusWidget(),
            ],
          ),
        ),
        /*3*/
        FavoriteWidget(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(icon),
            color: color,
            onPressed: (){
              if(label == "AVALIAR"){
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingsScreen()),
                );
              } else {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportProblemScreen()),
                );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      padding: const EdgeInsets.only(top: 20) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.feedback, 'AVALIAR'),
          _buildButtonColumn(Colors.yellow[600], Icons.report_problem, 'REPORTAR PROBLEMA'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            itemRating,
            itemRating,
            itemRating,
            buttonSection,
          ],
        ),
      ),
    );
  }
      
}