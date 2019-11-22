// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ihc_project/details.dart';
import 'package:ihc_project/shared.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RatingsScreen extends StatelessWidget {

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
            initialRating: 0,
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
              Text(
                'Preencha as estrelas de acordo com sua experiência!',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        /*3*/
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.only(top: 20) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonBar(
            children: [
              FlatButton(child: Text("Voltar"), onPressed: () {print("does nothing.");},),
              RaisedButton(
                child: Text("Concluir", style: TextStyle(color: Colors.white)),
                color: Colors.green[500], 
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Parabéns",
                    desc: "Operação realizada com sucesso!",
                    buttons: [
                      DialogButton(
                        color: Colors.green[500],
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailScreen())
                          );
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                },
              )
            ]
          )
        ],
      ),
    );

    return MaterialApp(
      title: 'Avaliar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Avaliar'),
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