// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ihc_project/details.dart';
import 'package:ihc_project/main.dart';
import 'package:ihc_project/shared.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RatingsScreen extends StatelessWidget {
  var currIndex = 0;

  RatingsScreen(idNum){
    currIndex = idNum;
  }


  Widget builtItemRating(name){
    return Container(
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 1),
              child: Text(
                name,
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
  }

  Widget buildTitleSection(name) {
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
  } 

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.only(top: 20) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonBar(
            children: [
              FlatButton(child: Text("Voltar"), onPressed: () {
                Navigator.pop(context);
              }),
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
                          Navigator.pop(context);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => DetailScreen(currIndex))
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
              dataInstance.itemPictures[currIndex],
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            buildTitleSection(dataInstance.itemNames[currIndex]),
            builtItemRating("Limpeza"),
            builtItemRating("Acessibilidade"),
            builtItemRating("Conforto"),
            buttonSection,
          ],
        ),
      ),
    );
  }   
}