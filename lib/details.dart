// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ihc_project/favorite.dart';
import 'package:ihc_project/homepage.dart';
import 'package:ihc_project/main.dart';
import 'package:ihc_project/ratings.dart';
import 'package:ihc_project/report_problem.dart';
import 'package:ihc_project/status.dart';

class DetailScreen extends StatelessWidget {
  var currIndex = 0;

  Widget buildItemRating(text, double rating){
    return Container(
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 1),
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            FlutterRatingBarIndicator(
              rating: rating,
              itemSize: 16,
              fillColor: Colors.amber,
              emptyColor: Colors.grey[400],
          ),
        ],
      ),
    );
  }  

  Widget buildTitleSection(name){
      return Container(
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
                    name,
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
  }

  DetailScreen(idNum){
    currIndex = idNum;
  }

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
                  MaterialPageRoute(builder: (context) => RatingsScreen(currIndex)),
                );
              } else if (label == "VOLTAR") {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()
                ));
              } else {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportProblemScreen(currIndex)),
                );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 32),
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
          _buildButtonColumn(color, Icons.arrow_back, "VOLTAR"),
          _buildButtonColumn(color, Icons.feedback, 'AVALIAR'),
          _buildButtonColumn(Colors.yellow[600], Icons.report_problem, 'REPORTAR PROBLEMA'),
        ],
      ),
    );

    return MaterialApp(
      title: "Detalhes",
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.popUntil(
                context, 
                (route) => route.isFirst
              );
            },
          ),
          title: Text("Detalhes"),
        ),
        body: ListView(
          children: [
            Image.asset(
              dataInstance.itemPictures[currIndex],
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            buildTitleSection(dataInstance.itemNames[currIndex]),
            buildItemRating("Limpeza", dataInstance.itemRatings[currIndex][0]),
            buildItemRating("Acessibilidade", dataInstance.itemRatings[currIndex][3]),
            buildItemRating("Conforto", dataInstance.itemRatings[currIndex][4]),
            buttonSection,
          ],
        ),
      ),
    );
  }
      
}